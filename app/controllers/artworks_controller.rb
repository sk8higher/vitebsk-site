# frozen_string_literal: true

class ArtworksController < ApplicationController
  before_action :set_person
  before_action :set_artwork, only: %i[show edit update destroy]

  def index
    @pagy, @artworks = pagy(@person.artworks.order(created_at: :desc), items: 8)
  end

  def show; end

  def new
    @artwork = Artwork.new
  end

  def edit; end

  def create
    @artwork = @person.artworks.build(artwork_params)

    if @artwork.save
      redirect_to person_artwork_path(@person, @artwork), notice: t('notice.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @artwork.update(artwork_params)
      redirect_to person_artwork_path(@person, @artwork), notice: t('notice.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork.destroy

    redirect_to person_artworks_path(@person), notice: t('notice.destroy.success')
  end

  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :photo)
  end
end
