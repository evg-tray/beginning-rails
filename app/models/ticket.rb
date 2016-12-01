class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwaysStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwaysStation', foreign_key: :end_station_id
end