module SocialAuth
  class Google < ::SocialAuth::AuthMiddleLayer

    def create_application
      application = self.user.applications.new

      application.provider = self.auth_hash[:provider]
      application.external_unique_id = self.auth_hash[:uid]
      application.metadata = self.auth_hash.to_json

      application.save
      application
    end

    def create_token(application)
      return nil if application.errors.present?

      token = self.user.tokens.new
      token.application = application
      token.token = self.token
      token.provider = self.auth_hash[:provider]
      token.expires_at = self.auth_hash[:credentials][:expires]

      token.save
      token
    end

    def generate_response(application, token)
      response = {}

      if application.blank? || application.errors.present?
        response.store(:message, 'Some error parsing oauth application data')
        response.store(:status, false)
        return response
      end

      if token.blank? || token.errors.present?
        response.store(:message, 'Some error parsing oauth token data')
        response.store(:status, false)
        return response
      end

      {
          data: {user: self.user, application: application, token: token} ,
          message: 'Application Successfully Connected',
          status: true
      }
    end

  end
end