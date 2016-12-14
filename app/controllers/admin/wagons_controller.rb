class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only:[:show, :update, :destroy, :edit]
  before_action :set_train, only:[:new, :create]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = @train.wagons.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to [:admin, @wagon]
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to admin_wagons_path
  end

  private

  def wagon_params
    params.require(:wagon).permit(:number,
                                  :train_id,
                                  :type,
                                  :top_seats,
                                  :bottom_seats,
                                  :side_top_seats,
                                  :side_bottom_seats,
                                  :sit_down_seats)
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
