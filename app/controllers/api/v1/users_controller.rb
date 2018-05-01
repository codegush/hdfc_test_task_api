module Api
  module V1
    class UsersController < Api::V1::BaseController
      include ErrorSerializer
      
      skip_before_action :authenticate, only: [:create]
      

      def index
        render json: User.all
      end

      def show
        render json: current_user
      end

      def create
        unless User.id_exists?(user_params[:email])
          identity = Identity.new(identity_params)
          identity.user = User.save_by_identity(user_params)
          if identity.save
            render json: { message: 'User was saved successfully' }, status: 200
          else
            render_http_error_code(:unprocessable_entity, message: 'Unable to save user')
          end
        else
          render_http_error_code(:unprocessable_entity, message: 'User already exist')
        end
      end

      private

      def identity_params
        { uid: SecureRandom.hex(10), provider: 'identity'}
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end
  end
end

