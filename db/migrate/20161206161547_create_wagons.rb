class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string  :serial_number
      t.integer :wagon_type_id
      t.integer :train_id
      t.integer :top_seats
      t.integer :bottom_seats
    end
  end
end
