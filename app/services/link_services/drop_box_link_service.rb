require 'dropbox_sdk'

module LinkServices
  class DropBoxLinkService < LinkServices::MiddleLinkService

    attr_accessor :user, :application, :token

    def initialize(options={})
      self.user = options[:user]
    end

    def fetch_link(file)
      binding.pry
      self.token = file.application.token
      dropbox_client.shares(file.path)['url']
    end

    private

    def dropbox_client
      @_client ||= DropboxClient.new(self.token.token)
    end
  end
end
