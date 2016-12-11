class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  scope :ordered, -> { order('"railway_stations_routes"."order"') }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(order: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:order)
  end

  def update_time(route, departure, arrival)
    station_route = station_route(route)
    station_route.update(departure: departure, arrival: arrival) if station_route
  end

  def departure(route)
    station_route(route).try(:departure)
  end

  def arrival(route)
    station_route(route).try(:arrival)
  end
  private

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
