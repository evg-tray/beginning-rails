class CreateRailwaysStationRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :railways_stations_routes do |t|
      t.integer :railways_station_id
      t.integer :route_id
    end
  end
end
