class Wagon < ApplicationRecord
  belongs_to :train, optional: true
  belongs_to :wagon_type
end