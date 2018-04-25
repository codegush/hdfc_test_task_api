module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate 

      rescue_from Errors::InvalidApiKeyError, with: :render_401
      rescue_from JWT::DecodeError, with: :render_401

      def logged_in?
        !!current_user
      end

      def current_user
        if auth_present?
          user = User.find(auth['user'])
          if user
            @current_user ||= user
          end
        end
      end

      def authenticate
        raise Errors::InvalidApiKeyError unless logged_in?
      end

      private

      def token
        request.env['HTTP_AUTHORIZATION'].scan(/Bearer (.*)$/).flatten.last
      end

      def auth
        Auth.decode(token)
      end

      def auth_present?
        !!request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
      end

      def render_401(_)
        render_http_error_code(:unauthorized, message: _.message)
      end

      def render_http_error_code(error_type, options = {})
        render json: Errors::ApiError.new(error_type, options), status: error_type
      end
    end
  end
end