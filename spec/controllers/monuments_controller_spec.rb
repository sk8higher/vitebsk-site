require_relative '../rails_helper'

RSpec.describe MonumentsController do
  let(:saved_monument) { create(:monument) }
  let(:created_monument) { build(:monument) }

  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the show template' do
      get :show, params: { id: saved_monument.id }
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
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image2.png'), 'image/png') }

    it 'creates a new monument and redirects to the show page' do
      expect {
        post :create, params: { monument: { name: created_monument.name,
                                           description: created_monument.description,
                                           photo: file } }
      }.to change(Monument, :count).by(1)
      expect(response).to redirect_to(assigns(:monument))
    end

    it 'returns unprocessable_entity if monument is not saved' do
      expect {
        post :create, params: { monument: { name: nil,
                                           description: nil,
                                           photo: file } }
      }.not_to change(Monument, :count).from(0)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, params: { id: saved_monument.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image1.png'), 'image/png') }

    it 'updates the monument and redirects to the show page' do
      new_description = Faker::Lorem.characters(number: 40)

      patch :update, params: { id: saved_monument.id, monument: { name: Faker::Lorem.characters(number: 40),
                                                                 description: new_description,
                                                                 photo: file } }
      expect(response).to redirect_to(assigns(:monument))
      saved_monument.reload
      expect(saved_monument.description).to eq(new_description)
    end

    it 'returns unprocessable entity if building is not updated' do
      patch :update, params: { id: saved_monument.id, monument: { name: nil,
                                                                 description: nil,
                                                                 photo: file } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the monument and redirects to the index page' do
      delete_monument = create(:monument)
      expect {
        delete :destroy, params: { id: delete_monument.id }
      }.to change(Monument, :count).by(-1)
      expect(response).to redirect_to(monuments_path)
    end
  end
end
