class AddNameAndAdressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :adress, :text
  end
end
