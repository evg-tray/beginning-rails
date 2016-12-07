class ReservedWagon < Wagon
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true
  def self.model_name
    Wagon.model_name
  end
end