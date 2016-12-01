class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwaysStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
end
