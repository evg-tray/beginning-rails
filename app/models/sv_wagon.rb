class SvWagon < Wagon
  validates :bottom_seats, presence: true
  def self.model_name
    Wagon.model_name
  end
end