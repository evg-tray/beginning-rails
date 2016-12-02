class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwaysStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
end
