module LinkServices
  class BaseService

    attr_accessor :type, :object

    def self.new(*args, &blk)
      o = super(*args, &blk)
      o.object || o
    end

    def initialize(options={})
      self.type = options[:provider]
      klass = type_hash[self.type.to_sym].constantize
      self.object = klass.new(options)
    end

    def type_hash
      @_type_hash ||= {
          dropbox_oauth2:  'LinkServices::DropBoxLinkService',
          windowslive:  'LinkServices::UniWindowsLiveTreeService',
          google_oauth2:  'LinkServices::GoogleLinkService',
      }
    end
  end
end