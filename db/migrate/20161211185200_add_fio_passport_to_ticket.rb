class AddFioPassportToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :fio, :string
    add_column :tickets, :passport, :string
  end
end
