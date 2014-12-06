class OAuthApplication < ActiveRecord::Base

  attr_accessor :id, :provider, :user_id, :external_unique_id, :metadata

  has_one :token, class_name: 'OAuthToken', foreign_key: 'application_id'

end