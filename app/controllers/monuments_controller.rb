# frozen_string_literal: true

class MonumentsController < ApplicationController
  before_action :set_monument, only: %i[show edit update destroy]

  def index
    @pagy, @monuments = pagy(Monument.order(created_at: :desc), items: 8)
  end

  def show; end

  def new
    @monument = Monument.new
  end

  def edit; end

  def create
    @monument = Monument.new(monument_params)

    if @monument.save
      redirect_to monument_path(@monument), notice: t('notice.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @monument.update(monument_params)
      redirect_to monument_path(@monument), notice: t('notice.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @monument.destroy

    redirect_to monuments_url, notice: t('notice.destroy.success')
  end

  private

  def set_monument
    @monument = Monument.find(params[:id])
  end

  def monument_params
    params.require(:monument).permit(I18n.available_locales.map do |l|
      [:"name_#{Mobility.normalize_locale(l)}", :"description_#{Mobility.normalize_locale(l)}"]
    end.flatten, :photo)
  end
end
