class Route < ApplicationRecord
  validates :name, presence: true
  has_many :trains
  has_many :railways_stations
end
