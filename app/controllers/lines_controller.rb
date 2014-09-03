class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
    @stations = Station.all
    @line = Line.new
  end

  def create
    @line = Line.create(params[:line])
    if @line.save
      flash[:notice] = "Line created."
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def show
    @stations = Station.all
    @line = Line.find(params[:id])
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:alert] = "#{@line.name} line deleted."
    redirect_to lines_path
  end

  def edit
    @line = Line.find(params[:id])
    @stations = Station.all
  end

  def update
    @line = Line.find(params[:id])
    if @line.update_attributes(params[:line])
      flash[:notice] = "#{@line.name} has been updated."
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

end
