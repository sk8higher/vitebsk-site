require_relative '../rails_helper'

RSpec.describe PeopleController do
  let(:tag) { create(:tag) }
  let(:saved_person) { create(:person, tag_id: tag.id) }
  let(:created_person) { build(:person, tag_id: tag.id) }

  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the show template' do
      get :show, params: { id: saved_person.id }
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
    it 'creates a new person and redirects to the show page' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image4.jpg'), 'image/png')
      expect do
        post :create, params: { person: { name: created_person.name,
                                         bio: created_person.bio,
                                         photo: file,
                                         tag_id: tag.id } }
      end.to change(Person, :count).by(1)
      expect(response).to redirect_to(assigns(:person))
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, params: { id: saved_person.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'updates the person and redirects to the show page' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image2.png'), 'image/png')
      new_bio = Faker::Lorem.characters(number: 40)

      patch :update, params: { id: saved_person.id, person: { name: Faker::Lorem.characters(number: 40),
                                                             bio: new_bio,
                                                             photo: file } }
      expect(response).to redirect_to(assigns(:person))
      saved_person.reload
      expect(saved_person.bio).to eq(new_bio)
    end

    it 'returns unprocessable entity if person is not updated' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image2.png'), 'image/png')
      patch :update, params: { id: saved_person.id, person: { name: nil,
                                                             bio: nil,
                                                             photo: file } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the person and redirects to the index page' do
      delete_person = create(:person, tag_id: tag.id)
      expect do
        delete :destroy, params: { id: delete_person.id }
      end.to change(Person, :count).by(-1)
      expect(response).to redirect_to(people_path)
    end
  end
end
