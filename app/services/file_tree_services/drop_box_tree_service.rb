require 'dropbox_sdk'

module FileTreeServices
  class DropBoxTreeService < FileTreeServices::MiddleTreeService

    attr_accessor :user, :application, :token

    def initialize(options={})
      self.user = options[:user]
      self.application = options[:application]
      self.token = self.application.token
    end

    def run
      fetch_data
    end

    def fetch_data(path='/', parent_file=nil)
      file_data = dropbox_client.metadata(path)
      file = self.user.files.new
      file.application = self.application
      file.parent_id = parent_file.id if parent_file.present?
      file.path = file_data['path']
      file.is_dir = file_data['is_dir']
      file.save


      file_info = FileInformation.new
      file_info.external_file = file
      file_info.file_hash = file_data['hash']
      file_info.rev = file_data['rev']
      file_info.icon = file_data['icon']
      file_info.bytes = file_data['bytes']
      file_info.size = file_data['size']
      file_info.revision = file_data['revision']
      file_info.root = file_data['root']
      file_info.modified = file_data['modified']
      file_info.client_mtime = file_data['client_mtime']
      file_info.thumb_exists = file_data['thumb_exists']
      file_info.mime_type = file_data['mime_type']

      file_info.save

      fetch_from_cursor
    end

    def fetch_from_cursor
      data = dropbox_client.delta

      data['entries'].each do |entry|
        new_path = entry.first
        root_path = new_path.split('/')[0..-2].join('/').presence || '/'

        parent = self.user.files.where(application_id: self.application.id, path: root_path).first
        file = self.user.files.new
        file.application = self.application
        file.parent_id = parent.id if parent.present?
        file.path = entry.first
        file.is_dir = entry.last['is_dir']
        file.save

        file_info = FileInformation.new
        file_info.external_file_id = file.id
        file_info.file_hash = entry.last['hash']
        file_info.rev = entry.last['rev']
        file_info.icon = entry.last['icon']
        file_info.bytes = entry.last['bytes']
        file_info.size = entry.last['size']
        file_info.revision = entry.last['revision']
        file_info.root = entry.last['root']
        file_info.modified = entry.last['modified']
        file_info.client_mtime = entry.last['client_mtime']
        file_info.thumb_exists = entry.last['thumb_exists']
        file_info.mime_type = entry.last['mime_type']

        file_info.save
      end
    end

    private

    def dropbox_client
      @_client ||= DropboxClient.new(self.token.token)
    end
  end
end