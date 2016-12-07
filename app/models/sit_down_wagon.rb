class SitDownWagon < Wagon
  validates :sit_down_seats, presence: true
  def self.model_name
    Wagon.model_name
  end
end