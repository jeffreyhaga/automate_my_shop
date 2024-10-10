class AddSlugToFlows < ActiveRecord::Migration[7.1]
  def change
    add_column :flows, :slug, :string
    add_index :flows, :slug, unique: true
  end
end
