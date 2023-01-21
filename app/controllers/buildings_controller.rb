class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]

  def index
    @pagy, @buildings = pagy(Building.all.order(created_at: :desc), items: 12)
  end

  def show
  end

  def new
    @building = Building.new
  end

  def edit
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to building_path(@building)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @building.destroy

    redirect_to buildings_url, notice: 'Статья была успешно уничтожена.'
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :description, :photo)
  end
end
