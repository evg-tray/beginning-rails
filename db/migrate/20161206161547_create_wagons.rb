class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :sit_down_seats
      t.references :train
      t.string :type

      t.timestamps
    end
  end
end
