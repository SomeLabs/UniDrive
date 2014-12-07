require 'google/api_client'
require 'google_drive'

module ProfileServices
  class GoogleInfoFetchService

    attr_accessor :user, :application, :token

    def initialize(options={})
      self.user = options[:user]
      self.token = options[:token]
      self.application = options[:application]
    end

    def run
      drive = google_client.discovered_api('drive', 'v2')
      result = google_client.execute(api_method: drive.about.get)
      account_info = result.data.to_hash

      profile = self.user.profiles.new
      profile.provider = self.application.provider
      profile.display_name = account_info['user']['displayName']
      profile.quota = account_info['quotaBytesTotal']
      profile.used = account_info['quotaBytesUsed']

      profile.metadata = account_info.to_json
      profile.save
    end

    def google_client
      @_client = Google::APIClient.new(application_name: 'unidrive', application_version: '1.0.0')
      @_client.authorization.access_token = self.token.token
      @_client
    end

  end
end
