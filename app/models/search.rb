class Search #< ApplicationRecord
  include ActiveModel::Model

  attr_accessor :start_station_id, :end_station_id

  def get_result
    start_station_id_q = ActiveRecord::Base.connection.quote(start_station_id)
    end_station_id_q = ActiveRecord::Base.connection.quote(end_station_id)
    query = "SELECT \"trains\".*, rsr_start.departure, rsr_end.arrival FROM \"trains\"
      LEFT JOIN \"railway_stations_routes\" as rsr_start
      ON rsr_start.\"route_id\" = \"trains\".\"route_id\"
      LEFT JOIN \"railway_stations_routes\" as rsr_end
      ON rsr_end.\"route_id\" = \"trains\".\"route_id\"
      WHERE rsr_start.railway_station_id = #{start_station_id_q} AND
      rsr_end.railway_station_id = #{end_station_id_q} AND
      \"trains\".route_id IN (
        SELECT \"routes\".id FROM \"routes\"
        LEFT JOIN \"railway_stations_routes\" as order_start
        ON \"routes\".\"id\" = order_start.\"route_id\"
        LEFT JOIN \"railway_stations_routes\" as order_end
        ON \"routes\".\"id\" = order_end.\"route_id\"
        WHERE order_start.railway_station_id = #{start_station_id_q}
        AND order_end.railway_station_id = #{end_station_id_q}
        AND order_start.\"order\" < order_end.\"order\")"
    ActiveRecord::Base.connection.exec_query(query)
  end
end