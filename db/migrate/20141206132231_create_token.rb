class CreateToken < ActiveRecord::Migration
  def change
    create_table :o_auth_tokens do |t|
      t.integer :user_id
      t.integer :application_id
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
