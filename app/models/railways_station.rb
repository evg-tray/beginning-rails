class RailwaysStation < ApplicationRecord
  has_many :routes
  has_many :trains, foreign_key: :current_station_id
end
