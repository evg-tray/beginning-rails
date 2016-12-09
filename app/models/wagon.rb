class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, uniqueness: { scope: :train_id }, if: :train?
  before_validation :set_number

  def self.inherited(base)
    super
    def base.model_name
      superclass.model_name
    end
  end

  private

  def train?
    !train.nil?
  end

  def set_number
    if train
      max_number = Wagon.where(train_id: train.id).maximum(:number) || 0
      self.number ||= max_number.next
    else
      self.number = nil;
    end
  end
end