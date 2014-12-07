module ProfileServices
  class BaseInfoFetchService

    SERVICE_HASH = {
        dropbox_oauth2:  'ProfileServices::DropBoxInfoFetchService',
        google_oauth2:  'ProfileServices::GoogleInfoFetchService',
    }

    attr_accessor :user, :token, :application

    def initialize(options={})
      self.user = options[:user]
      self.token = options[:token]
      self.application = options[:application]
    end

    def run
      SERVICE_HASH[self.application.provider.to_sym].constantize.new({
                                                                         user: self.user,
                                                                         token: self.token,
                                                                         application: self.application
                                                                     }).run
    end
  end
end
