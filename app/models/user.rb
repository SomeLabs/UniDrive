class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :applications, class_name: 'OAuthApplication', foreign_key: :user_id
  has_many :tokens, class_name: 'OAuthToken', foreign_key: :user_id
  has_many :profiles, foreign_key: :user_id
  has_many :files, class_name: 'ExternalFile', foreign_key: :user_id

end
