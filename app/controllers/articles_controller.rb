# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @pagy, @articles = pagy(Article.all.order(created_at: :desc), items: 8)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article), notice: t('notice.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      @article.images.attach(params[:article][:images]) if params[:article][:images].present?
      redirect_to article_path(@article), notice: t('notice.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_url, notice: t('notice.destroy.success')
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(I18n.available_locales.map do |l|
      [:"name_#{Mobility.normalize_locale(l)}", :"description_#{Mobility.normalize_locale(l)}"]
    end.flatten, :images)
  end
end
