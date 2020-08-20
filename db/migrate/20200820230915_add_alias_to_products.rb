class AddAliasToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :alias, :string
  end
end
