module SocialAuth
  class Base

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
          dropbox_oauth2:  'SocialAuth::DropBox',
      }
    end

  end
end