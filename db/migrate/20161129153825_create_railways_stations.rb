class CreateRailwaysStations < ActiveRecord::Migration[5.0]
  def change
    create_table :railways_stations do |t|
      t.string :title

      t.timestamps
    end
  end
end
