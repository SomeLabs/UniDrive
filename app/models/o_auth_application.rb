class OAuthApplication < ActiveRecord::Base

  has_one :token, class_name: 'OAuthToken', foreign_key: 'application_id'
  belongs_to :user, foreign_key: :user_id

end