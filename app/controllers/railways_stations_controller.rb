class RailwaysStationsController < ApplicationController
  before_action :set_railways_station, only: [:show, :edit, :update, :destroy]

  # GET /railways_stations
  # GET /railways_stations.json
  def index
    @railways_stations = RailwaysStation.all
  end

  # GET /railways_stations/1
  # GET /railways_stations/1.json
  def show
  end

  # GET /railways_stations/new
  def new
    @railways_station = RailwaysStation.new
  end

  # GET /railways_stations/1/edit
  def edit
  end

  # POST /railways_stations
  # POST /railways_stations.json
  def create
    @railways_station = RailwaysStation.new(railways_station_params)

    respond_to do |format|
      if @railways_station.save
        format.html { redirect_to @railways_station, notice: 'Railways station was successfully created.' }
        format.json { render :show, status: :created, location: @railways_station }
      else
        format.html { render :new }
        format.json { render json: @railways_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railways_stations/1
  # PATCH/PUT /railways_stations/1.json
  def update
    respond_to do |format|
      if @railways_station.update(railways_station_params)
        format.html { redirect_to @railways_station, notice: 'Railways station was successfully updated.' }
        format.json { render :show, status: :ok, location: @railways_station }
      else
        format.html { render :edit }
        format.json { render json: @railways_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /railways_stations/1
  # DELETE /railways_stations/1.json
  def destroy
    @railways_station.destroy
    respond_to do |format|
      format.html { redirect_to railways_stations_url, notice: 'Railways station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railways_station
      @railways_station = RailwaysStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railways_station_params
      params.require(:railways_station).permit(:title)
    end
end
