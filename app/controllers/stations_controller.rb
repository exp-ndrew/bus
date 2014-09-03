class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.create(params[:station])
    if @station.save
      flash[:notice] = "Station created."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:alert] = "#{@station.name} station deleted."
    redirect_to stations_path
  end

  def edit
    @station = Station.find(params[:id])
    @lines = Line.all
  end

  def update
    @station = Station.find(params[:id])
    if @station.update_attributes(params[:station])
      flash[:notice] = "#{@station.name} has been updated."
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

end
