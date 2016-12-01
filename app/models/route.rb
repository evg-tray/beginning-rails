class Route < ApplicationRecord
  validates :name, presence: true
  has_many :trains
end
