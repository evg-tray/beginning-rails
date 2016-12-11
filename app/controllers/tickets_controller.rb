class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id],
                         end_station_id: params[:end_station_id])
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :train_id, :start_station_id, :end_station_id, :fio, :passport)
  end
end