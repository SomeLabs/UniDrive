class ChangeProfile < ActiveRecord::Migration
  def change
    add_column :profile, :application_id, :integer
  end
end
