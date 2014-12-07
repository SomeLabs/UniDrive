require 'dropbox_sdk'
module ProfileServices
  class DropBoxInfoFetchService

    attr_accessor :user, :application, :token

    def initialize(options={})
      self.user = options[:user]
      self.token = options[:token]
      self.application = options[:application]
    end

    def run
      account_info = dropbox_client.account_info
      profile = self.user.profiles.where(provider: self.application.provider, application_id: self.application.id).first || self.user.profiles.new
      profile.provider = self.application.provider
      profile.application_id = self.application.id
      profile.display_name = account_info['display_name']
      profile.quota = account_info['quota_info']['quota']
      profile.used = account_info['quota_info']['datastores'] + account_info['quota_info']['shared'] + account_info['quota_info']['normal']

      profile.metadata = account_info.to_json
      profile.save
    end

    def dropbox_client
      @_client ||= DropboxClient.new(self.token.token)
    end

  end
end
