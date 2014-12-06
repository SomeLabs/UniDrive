module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        resource = resource_from_credentials
        #build_resource
        return invalid_login_attempt unless resource

        if resource.valid_password?(params[:password])
          sign_in(resource_name, resource)
          render json: {success: true, message: 'Login Successfull'}
        else
          invalid_login_attempt
        end
      end

      protected
      def invalid_login_attempt
        warden.custom_failure!
        render json: { success: false, message: 'Error with your login or password' }, status: 401
      end

      def resource_from_credentials
        data = { email: params[:email] }
        if res = resource_class.find_for_database_authentication(data)
          if res.valid_password?(params[:password])
            res
          end
        end
      end
    end
  end
end

