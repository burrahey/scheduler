class AddOmniauthToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :provider, :string
    add_index :employees, :provider
    add_column :employees, :uid, :string
    add_index :employees, :uid
  end
end
