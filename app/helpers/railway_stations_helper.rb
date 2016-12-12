module RailwayStationsHelper
  def date_to_time(date)
    {hour: date ? date.hour : '12', minute: date ? date.min : '00'}
  end
end
