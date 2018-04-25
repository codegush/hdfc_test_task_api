module Api
  module V1
    class SessionsController < Api::V1::BaseController

      skip_before_action :authenticate, only: [:create]
      
      def create
        # Omniauth login process
        auth = request.env['omniauth.auth']
        if auth
          @identity = Identity.find_with_omniauth(auth)

          if @identity.nil?
            # If identity is not present, create new one
            @identity = Identity.create_with_omniauth(auth)
          end

          if logged_in?
            if @identity.user == current_user
              # Logged in user with linked provider
              puts 'Already linked this account'
            else
              # Logged in user with non-linked provider
              @identity.user = current_user
              @identity.save
              puts 'New provider added to the current user'
            end
          else
            # Cases for non-logged in users
            if @identity.user.present?
              # If identity is already linked
              jwt = Auth.issue({ user: user.id })
              render json: { jwt: jwt }, status: :ok
            else
              # If identity is not linked, create a user and associate
              # the identity with the user
              user = User.find_by_email(auth['info']['email'])

              unless user
                User.create_with_omniauth(auth['info'])
                @identity.user = user
                @identity.save
              end
              puts 'New user created and associated with the user'
              jwt = Auth.issue({ user: user.id })
              render json: { jwt: jwt }, status: :ok
            end
          end
        end


        # Normal login process
        if auth_params[:email] && auth_params[:password]
          user = User.find_by(email: auth_params[:email])
          if user && user.authenticate(auth_params[:password])
            jwt = Auth.issue({ user: user.id })
            render json: {jwt: jwt}
          else
            render_http_error_code(:unprocessable_entity, message: 'Wrong credentials')
          end
        end 
      end

      private

      def auth_params
        params.require(:auth).permit(:email, :password)
      end
    end
  end
end