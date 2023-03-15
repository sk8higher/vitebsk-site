require_relative '../rails_helper'

RSpec.describe BuildingsController do
  let(:saved_building) { create(:building) }
  let(:created_building) { build(:building) }

  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the show template' do
      get :show, params: { id: saved_building.id }
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
    it 'creates a new building and redirects to the show page' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image1.png'), 'image/png')
      expect {
        post :create, params: { building: { name: created_building.name,
                                           description: created_building.description,
                                           photo: file } }
      }.to change(Building, :count).by(1)
      expect(response).to redirect_to(assigns(:building))
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, params: { id: saved_building.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'updates the building and redirects to the show page' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image2.png'), 'image/png')
      new_description = Faker::Lorem.characters(number: 40)

      patch :update, params: { id: saved_building.id, building: { name: Faker::Lorem.characters(number: 40),
                                                                 description: new_description,
                                                                 photo: file } }
      expect(response).to redirect_to(assigns(:building))
      saved_building.reload
      expect(saved_building.description).to eq(new_description)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the building and redirects to the index page' do
      expect {
        delete :destroy, params: { id: saved_building.id }
      }.to change(Building, :count).by(-1)
      expect(response).to redirect_to(buildings_path)
    end
  end
end
