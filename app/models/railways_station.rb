class RailwaysStation < ApplicationRecord
  has_many :routes
  has_many :trains
end
