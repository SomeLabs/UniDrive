class CreateExternalFile < ActiveRecord::Migration
  def change
    create_table :external_files do |t|
      t.integer :user_id
      t.integer :application_id
      t.integer :parent_id
      t.string :path
      t.boolean :is_dir

      t.timestamps
    end
  end
end
