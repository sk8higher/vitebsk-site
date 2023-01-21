class MonumentsController < ApplicationController
  before_action :set_monument, only: %i[show edit update destroy]

  def index
    @pagy, @monuments = pagy(Monument.all.order(created_at: :desc), items: 12)
  end

  def show
  end

  def new
    @monument = Monument.new
  end

  def edit
  end

  def create
    @monument = Monument.new(monument_params)

    if @monument.save
      redirect_to monument_path(@monument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @monument.update(monument_params)
      redirect_to monument_path(@monument)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @monument.destroy

    redirect_to monuments_url, notice: 'Статья была успешно уничтожена.'
  end

  private

  def set_monument
    @monument = Monument.find(params[:id])
  end

  def monument_params
    params.require(:monument).permit(:name, :description, :photo)
  end
end
