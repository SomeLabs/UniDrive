class CreateApplication < ActiveRecord::Migration
  def change
    create_table :o_auth_applications do |t|
      t.integer :user_id
      t.string :provider
      t.string :external_unique_id
      t.text :metadata

      t.timestamps
    end
  end
end
