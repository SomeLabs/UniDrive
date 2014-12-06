class CreateFileInformation < ActiveRecord::Migration
  def change
    create_table :file_informations do |t|
      t.integer :external_file_id
      t.string :file_hash
      t.string :rev
      t.string :icon
      t.integer :bytes
      t.string :size
      t.integer :revision
      t.string :root
      t.text :contents
      t.string :mime_type
      t.timestamp :modified
      t.timestamp :client_mtime
      t.boolean :thumb_exists
    end
  end
end
