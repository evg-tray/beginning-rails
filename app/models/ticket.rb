class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train, optional: true
  belongs_to :start_station, class_name: 'RailwaysStation', optional: true
  belongs_to :end_station, class_name: 'RailwaysStation', optional: true
end