module SocialAuth
  class AuthMiddleLayer < ::SocialAuth::Base

    attr_accessor :user, :token, :auth_hash

    def initialize(options={})
      self.user = options[:user]
      self.auth_hash = options[:auth_hash]
      self.token = options[:auth_hash][:credentials][:token]
      binding.pry
    end

    def create
      application = find_or_create_application
      token = find_or_create_token(application)

      generate_response(application, token)
    end

    def find_or_create_token(application)
      token = self.user.tokens.where(provider: self.auth_hash[:provider], application_id: application.id).first
      token || create_token(application)
    end

    def find_or_create_application
      application = self.user.applications.where(provider: self.auth_hash[:provider], external_unique_id: self.auth_hash[:uid]).last
      application || create_application
    end
  end
end
