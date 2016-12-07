class AddOrderFromHeadToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :order_from_head, :boolean, default: true
  end
end
