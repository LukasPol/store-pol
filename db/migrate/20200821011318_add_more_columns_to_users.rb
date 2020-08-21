class AddMoreColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cpf, :string
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
    add_reference :users, :gender, foreign_key: true
  end
end
