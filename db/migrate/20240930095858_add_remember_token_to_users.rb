class AddRememberTokenToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :remember_token, :string, limit: 20
  end
end
