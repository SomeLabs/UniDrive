module FileTreeServices
  class GoogleTreeService < FileTreeServices::MiddleTreeService

    attr_accessor :user, :application, :token

    def initialize(options={})
      self.user = options[:user]
      self.application = options[:application]
      self.token = self.application.token
    end

    def run
      drive = google_client.discovered_api('drive', 'v2')
      result = google_client.execute(api_method: drive.files.list)
      files = result.data.to_hash['items']
      fetch_data(files)
    end

    def fetch_data(files)
      files.each do |file_data|
        file = self.user.files.new
        file.application = self.application
        file.path = file_data['title']
        file.is_dir = false
        file.save

        file_info = FileInformation.new
        file_info.external_file = file
        file_info.file_hash = file_data['id']
        file_info.rev = file_data['version']
        file_info.icon = file_data['iconLink']
        file_info.bytes = file_data['quotaBytesUsed']
        file_info.size = file_data['fileSize']
        file_info.revision = file_data['revision']
        file_info.modified = file_data['modifiedByMeDate']
        file_info.mime_type = file_data['mimeType']
        file_info.save
      end

    end

    private

    def google_client
      @_client = Google::APIClient.new(application_name: 'unidrive', application_version: '1.0.0')
      @_client.authorization.access_token = self.token.token
      @_client
    end
  end
end