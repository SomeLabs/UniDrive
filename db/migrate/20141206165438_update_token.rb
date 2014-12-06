class UpdateToken < ActiveRecord::Migration
  def change
    add_column :o_auth_tokens, :provider, :string
  end
end
