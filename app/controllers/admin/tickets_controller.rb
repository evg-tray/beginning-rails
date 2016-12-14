class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only:[:show, :update, :destroy, :edit]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id],
                                       end_station_id: params[:end_station_id])
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      render :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :train_id, :start_station_id, :end_station_id, :fio, :passport, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end