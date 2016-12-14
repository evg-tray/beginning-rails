class RenameColumnSurnameToLastName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :surname, :lastname
  end
end
