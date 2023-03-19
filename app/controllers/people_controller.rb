# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :set_tags

  def index
    if params[:tag_id]
      @pagy, @people = pagy(Person.where(tag_id: params[:tag_id]).order(created_at: :desc), items: 8)
    else
      @pagy, @people = pagy(Person.all.order(created_at: :desc), items: 8)
    end
  end

  def show; end

  def new
    @person = Person.new
  end

  def edit; end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person), notice: t('notice.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      redirect_to person_path(@person), notice: t('notice.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, notice: t('notice.destroy.success')
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def set_tags
    @tags = Tag.all
  end

  def person_params
    params.require(:person).permit(:name, :bio, :photo, :tag_id)
  end
end
