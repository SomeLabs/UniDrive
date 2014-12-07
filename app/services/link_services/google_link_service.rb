module LinkServices
  class GoogleLinkService < LinkServices::MiddleLinkService

    attr_accessor :user, :application, :token

    def initialize(options={})
      self.user = options[:user]
    end

    def fetch_link(file)
      self.token = file.application.token.token 
      drive = google_client.discovered_api('drive', 'v2')
      result = google_client.execute(api_method: drive.files.get, parameters: {'fileId' => file.file_information.file_hash})
      result.data.to_hash['downloadUrl']
    end

    private
    def google_client
      @_client = Google::APIClient.new(application_name: 'unidrive', application_version: '1.0.0')
      @_client.authorization.access_token = self.token
      @_client
    end
  end
end
