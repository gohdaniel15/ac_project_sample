class PenguinsController < ApplicationController

  def index
    @penguins = Penguin.all
  end

  def show
    @penguin = penguin
  end

  def new
    @penguin = Penguin.new
  end

  def create
    @penguin = Penguin.new(penguin_params)
    if @penguin.save
      redirect_to penguins_path
    else
      render :new
    end
  end

  def edit
    @penguin = penguin
  end

  def update
    @penguin = penguin
    if @penguin.update(penguin_params)
      redirect_to penguins_path
    else
      redirect_to penguins_path, flash[:error] = 'Failed to create penguin'
    end
  end

  def destroy
    @penguin = penguin
    @penguin.destroy
    redirect_to penguins_path
  end

  private

  def penguin
    Penguin.find(params[:id])
  end

  def penguin_params
    params.require(:penguin).permit(:head, :body, :foot)
  end

end
