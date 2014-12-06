class ChangeTokenColumn < ActiveRecord::Migration
  def change
    change_column :o_auth_tokens, :token, :text
  end
end
