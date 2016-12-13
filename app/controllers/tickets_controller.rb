class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  def show
  end

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = current_user.tickets.new(train_id: params[:train_id], start_station_id: params[:start_station_id],
                         end_station_id: params[:end_station_id])
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:number, :train_id, :start_station_id, :end_station_id, :fio, :passport)
  end
end