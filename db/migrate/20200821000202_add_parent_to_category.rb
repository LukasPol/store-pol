class AddParentToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :parent, :integer
  end
end
