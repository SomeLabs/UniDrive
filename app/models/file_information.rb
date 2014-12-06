class FileInformation < ActiveRecord::Base

  belongs_to :external_file, foreign_key: :external_file_id
end