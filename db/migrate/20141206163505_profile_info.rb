class ProfileInfo < ActiveRecord::Migration
  def change
    create_table :profile do |t|
      t.integer :user_id
      t.string :provider
      t.string  :display_name
      t.integer  :quota
      t.integer :used
      t.text :metadata

      t.timestamps
    end
  end
end
