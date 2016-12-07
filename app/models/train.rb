class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  def count_seats_by_type(wagon_type, seats_type)
    Wagon.where(train_id: id, type: wagon_type).sum(seats_type)
  end
end
