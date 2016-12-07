class WagonsController < ApplicationController
  before_action :set_wagon, only:[:show, :update, :destroy, :edit]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

  private

  def wagon_params
    params.require(:wagon).permit(:serial_number, :train_id, :wagon_type_id, :top_seats, :bottom_seats)
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end
end
