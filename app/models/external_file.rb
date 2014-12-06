class ExternalFile < ActiveRecord::Base

  belongs_to :user, foreign_key: :user_id
  belongs_to :application, foreign_key: :application_id, class_name: 'OAuthApplication'
  has_one :file_information, foreign_key: :file_id, class_name: 'FileInformation'

end