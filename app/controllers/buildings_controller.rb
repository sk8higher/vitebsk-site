# frozen_string_literal: true

class BuildingsController < ApplicationController
  before_action :set_building, only: %i[show edit update destroy]

  def index
    @pagy, @buildings = pagy(Building.order(created_at: :desc), items: 8)
  end

  def show; end

  def new
    @building = Building.new
  end

  def edit; end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to building_path(@building), notice: t('notice.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building), notice: t('notice.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @building.destroy

    redirect_to buildings_url, notice: t('notice.destroy.success')
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(I18n.available_locales.map do |l|
      [:"name_#{Mobility.normalize_locale(l)}", :"description_#{Mobility.normalize_locale(l)}"]
    end.flatten, :photo)
  end
end
