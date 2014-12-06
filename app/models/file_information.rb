class FileInformation < ActiveRecord::Base

  belongs_to :external_file, foreign_key: :file_id
end