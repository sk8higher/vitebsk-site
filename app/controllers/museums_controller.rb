# frozen_string_literal: true

class MuseumsController < ApplicationController
  before_action :set_museum, only: %i[show edit update destroy]

  def index
    @pagy, @museums = pagy(Museum.order(created_at: :desc), items: 8)
  end

  def show; end

  def new
    @museum = Museum.new
  end

  def edit; end

  def create
    @museum = Museum.new(museum_params)

    if @museum.save
      redirect_to museum_path(@museum), notice: t('notice.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @museum.update(museum_params)
      redirect_to museum_path(@museum), notice: t('notice.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @museum.destroy

    redirect_to museums_url, notice: t('notice.destroy.success')
  end

  private

  def set_museum
    @museum = Museum.find(params[:id])
  end

  def museum_params
    params.require(:museum).permit(I18n.available_locales.map do |l|
      [:"name_#{Mobility.normalize_locale(l)}", :"description_#{Mobility.normalize_locale(l)}"]
    end.flatten, :photo)
  end
end
