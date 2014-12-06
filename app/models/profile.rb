class Profile < ActiveRecord::Base

  self.table_name = 'profile'

  belongs_to :user, foreign_key: :user_id
end