module FileTreeServices
  class UniWindowsLiveTreeService

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

    end
  end
end
