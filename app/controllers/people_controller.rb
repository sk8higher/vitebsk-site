class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :set_tags

  def index
    @pagy, @people = pagy(Person.all.order(created_at: :desc), items: 12)
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_path(@person), notice: 'Статья была успешно создана.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      redirect_to person_path(@person), notice: 'Статья была успешно обновлена.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, notice: 'Статья была успешно уничтожена.'
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def set_tags
    @tags = Tag.all
  end

  def person_params
    params.require(:person).permit(:name, :bio, :photo)
  end
end
