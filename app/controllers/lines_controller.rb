class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
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
    @line = Line.find(params[:id])
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:alert] = "#{@line.name.capitalize} line deleted."
    redirect_to lines_path
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    old_name = @line.name
    @line.update(params[:line])
    if @line.save
      flash[:notice] = "#{old_name} has been updated to #{@line.name}"
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

end
