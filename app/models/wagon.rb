class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, uniqueness: { scope: :train_id }
  before_validation :set_number

  private

  def set_number
    if train
      max_number = Wagon.where(train_id: train.id).maximum(:number)
      self.number ||= max_number ? max_number + 1 : 1
    else
      self.number = nil;
    end
  end
end