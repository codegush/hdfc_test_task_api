module Api
  module V1
    class UsersController < Api::V1::BaseController
      include ErrorSerializer
      
      skip_before_action :authenticate, only: [:create]
      

      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])
      end

      def create
        user = User.new(user_params).build(identities: identity_params)
        if user.save
          render json: {}, status: 200
        else
          render json: ErrorSerializer.serialize(user.errors), status: 422
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

