module SocialAuth
  class UniWindowsLive < ::SocialAuth::AuthMiddleLayer

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
  end
end