class AddUserToFlows < ActiveRecord::Migration[7.1]
  def change
    add_reference :flows, :user, null: false, foreign_key: true
  end
end
