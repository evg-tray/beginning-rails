class WagonTypesController < ApplicationController
  before_action :set_wagon_type, only:[:show, :update, :destroy, :edit]

  def index
    @wagon_types = WagonType.all
  end

  def show
  end

  def new
    @wagon_type = WagonType.new
  end

  def edit
  end

  def create
    @wagon_type = WagonType.new(wagon_type_params)
    if @wagon_type.save
      redirect_to @wagon_type
    else
      render :new
    end
  end

  def update
    if @wagon_type.update(wagon_type_params)
      redirect_to @wagon_type
    else
      render :edit
    end
  end

  def destroy
    @wagon_type.destroy
    redirect_to wagon_types_path
  end

  private

  def wagon_type_params
    params.require(:wagon_type).permit(:name)
  end

  def set_wagon_type
    @wagon_type = WagonType.find(params[:id])
  end
end
