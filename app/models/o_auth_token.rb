class OAuthToken < ActiveRecord::Base

  attr_accessor :id, :user_id, :application_id, :token, :expires_at

  belongs_to :application, class_name: 'OAuthApplication', foreign_key: 'application_id'


  def expires_at=(time=false)
    return nil unless time.present?

    super(time)
  end
end