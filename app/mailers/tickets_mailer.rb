class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Покупка билета')
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Отмена билета')
  end
end
