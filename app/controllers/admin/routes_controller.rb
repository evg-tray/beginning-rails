class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only:[:show, :update, :destroy, :edit, :update_name]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to [:admin, @route]
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route]
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  def update_name
    @route.update_name(@route, params[:name])
    redirect_to admin_routes_path
  end

  private

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
