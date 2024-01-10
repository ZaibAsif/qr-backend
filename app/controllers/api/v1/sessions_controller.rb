# frozen_string_literal: true

module API
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protect_from_forgery with: :null_session
      include API::Concerns::ActAsAPIRequest

      def create
        super do
          render  json: { user: current_user, 
                  token: @token }.to_json and return
        end
      end

      private

      def resource_params
        params.require(:user).permit(:email, :password)
      end

      def render_create_success
        render :create
      end
    end
  end
end
