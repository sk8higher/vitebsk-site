class MuseumsController < ApplicationController
  before_action :set_museum, only: %i[ show edit update destroy ]

  def index
    @pagy, @museums = pagy(Museum.all.order(created_at: :desc), items: 12)
  end

  def show
  end

  def new
    @museum = Museum.new
  end

  def edit
  end

  def create
    @museum = Museum.new(museum_params)

    if @museum.save
      redirect_to museum_path(@museum)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @museum.update(museum_params)
      redirect_to museum_path(@museum)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @museum.destroy

    redirect_to museums_url, notice: 'Статья была успешно уничтожена.'
  end

  private

  def set_museum
    @museum = Museum.find(params[:id])
  end

  def museum_params
    params.require(:museum).permit(:name, :description, :photo)
  end
end
