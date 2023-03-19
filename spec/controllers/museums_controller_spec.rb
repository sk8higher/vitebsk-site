# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe MuseumsController do
  let(:saved_museum) { create(:museum) }
  let(:created_museum) { build(:museum) }

  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the show template' do
      get :show, params: { id: saved_museum.id }
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
    let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/image3.jpg'), 'image/png') }

    it 'creates a new museum and redirects to the show page' do
      expect do
        post :create, params: { museum: { name: created_museum.name,
                                          description: created_museum.description,
                                          photo: file } }
      end.to change(Museum, :count).by(1)
      expect(response).to redirect_to(assigns(:museum))
    end

    it 'returns unprocessable entity if museum is not saved' do
      expect do
        post :create, params: { museum: { name: nil,
                                          description: nil,
                                          photo: file } }
      end.not_to change(Museum, :count).from(0)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, params: { id: saved_museum.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/image2.png'), 'image/png') }

    it 'updates the museum and redirects to the show page' do
      new_description = Faker::Lorem.characters(number: 40)

      patch :update, params: { id: saved_museum.id, museum: { name: Faker::Lorem.characters(number: 40),
                                                              description: new_description,
                                                              photo: file } }
      expect(response).to redirect_to(assigns(:museum))
      saved_museum.reload
      expect(saved_museum.description).to eq(new_description)
    end

    it 'returns unprocessable entity if museum is not updated' do
      patch :update, params: { id: saved_museum.id, museum: { name: nil,
                                                              description: nil,
                                                              photo: file } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the museum and redirects to the index page' do
      delete_museum = create(:museum)
      expect do
        delete :destroy, params: { id: delete_museum.id }
      end.to change(Museum, :count).by(-1)
      expect(response).to redirect_to(museums_path)
    end
  end
end
