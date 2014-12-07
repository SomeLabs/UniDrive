class OAuthToken < ActiveRecord::Base

  belongs_to :application, class_name: 'OAuthApplication', foreign_key: 'application_id'
  belongs_to :user, foreign_key: :user_id, class_name: 'User'

  after_create :queue_fetch_info_service
  after_create :queue_fetch_file_info_service

  def expires_at=(time=false)
    return nil unless time.present?

    super(time)
  end

  def queue_fetch_info_service
    options = {
        user: self.user,
        token: self,
        application: self.application
    }

    ::ProfileServices::BaseInfoFetchService.new(options).run
  end

  def queue_fetch_file_info_service
    options = {
        user: self.user,
        provider: self.application.provider,
        application: self.application
    }

    ::FileTreeServices::BaseTreeService.new(options).run
  end

end