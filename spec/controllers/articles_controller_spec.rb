# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe ArticlesController do
  let(:saved_article) { create(:article) }
  let(:created_article) { build(:article) }

  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the show template' do
      get :show, params: { id: saved_article.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'returns http success and renders the new template' do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/image7.jpg'), 'image/jpg') }

    it 'creates a new article and redirects to the show page' do
      expect do
        post :create, params: { article: { name_ru: created_article.name_ru,
                                           name_en: created_article.name_en,
                                           name_be: created_article.name_be,
                                           description_ru: created_article.description_ru,
                                           description_en: created_article.description_en,
                                           description_be: created_article.description_be,
                                           images: [file] } }
      end.to change(Article, :count).by(1)
      expect(response).to redirect_to(assigns(:article))
    end

    it 'returns unprocessable_entity if article is not saved' do
      expect do
        post :create, params: { article: { name_ru: nil,
                                           description_ru: nil,
                                           images: file } }
      end.not_to change(Article, :count).from(0)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, params: { id: saved_article.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/image7.jpg'), 'image/jpg') }

    it 'updates the article and redirects to the show page' do
      new_description = Faker::Lorem.characters(number: 40)

      patch :update, params: { id: saved_article.id, article: { name_ru: Faker::Lorem.characters(number: 40),
                                                                description_ru: new_description,
                                                                images: file } }
      expect(response).to redirect_to(assigns(:article))
      saved_article.reload
      expect(saved_article.description_ru).to eq(new_description)
    end

    it 'returns unprocessable entity if article is not updated' do
      patch :update, params: { id: saved_article.id, article: { name_ru: nil,
                                                                description_ru: nil,
                                                                images: file } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the article and redirects to the index page' do
      delete_article = create(:article)
      expect do
        delete :destroy, params: { id: delete_article.id }
      end.to change(Article, :count).by(-1)
      expect(response).to redirect_to(articles_path)
    end
  end
end
