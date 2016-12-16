class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :train, optional: true
  belongs_to :start_station, class_name: 'RailwayStation', optional: true
  belongs_to :end_station, class_name: 'RailwayStation', optional: true

  after_create :send_notification_buy
  after_destroy :send_notification_cancel

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification_buy
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def send_notification_cancel
    TicketsMailer.cancel_ticket(user, self).deliver_now
  end
end