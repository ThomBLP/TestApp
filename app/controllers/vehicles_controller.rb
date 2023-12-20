class VehiclesController < ApplicationController

  before_action :authenticate_user!

  def new
    @vehicle = Vehicle.new
  end

  def index
    @vehicles = Vehicle.all
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save!
      flash.notice = "Annonce créee"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
  end


  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :description, :price, :id, :photo)
  end

end
