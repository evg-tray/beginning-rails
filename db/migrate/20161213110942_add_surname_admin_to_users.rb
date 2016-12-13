class AddSurnameAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :surname, :string
    add_column :users, :admin, :boolean, default: false
  end
end