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
    flash[:alert] = "#{@station.name.capitalize} station deleted."
    redirect_to stations_path
  end

  def edit
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])
    old_name = @station.name
    @station.update(params[:station])
    if @station.save
      flash[:notice] = "#{old_name} has been updated to #{@station.name}"
      redirect_to station_path(@station)
    else
      render 'edit'
    end
  end

end
