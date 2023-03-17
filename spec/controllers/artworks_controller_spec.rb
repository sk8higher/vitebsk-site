require_relative '../rails_helper'

RSpec.describe ArtworksController do
  let(:tag) { create(:tag) }
  let(:saved_person) { create(:person, tag_id: tag.id) }
  let(:created_person) { build(:person, tag_id: tag.id) }

  let(:saved_artwork) { create(:artwork, person_id: saved_person.id) }
  let(:created_artwork) { build(:artwork, person_id: saved_person.id) }

  describe 'GET #index' do
    it 'returns http success and renders the index template' do
      get :index, params: { person_id: saved_person.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the show template' do
      get :show, params: { person_id: saved_person.id, id: saved_artwork.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'returns http success and renders the new template' do
      get :new, params: { person_id: saved_person.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new artwork and redirects to the show page' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image6.jpg'), 'image/png')
      expect {
        post :create, params: { person_id: saved_person.id, artwork: { title: created_artwork.title,
                                                                      description: created_artwork.description,
                                                                      photo: file } }
      }.to change(Artwork, :count).by(1)
      expect(response).to redirect_to(person_artwork_path(saved_person, Artwork.last))
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the edit template' do
      get :edit, params: { person_id: saved_person.id, id: saved_artwork.id }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'updates the artwork and redirects to the show page' do
      file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image2.png'), 'image/png')
      new_desc = Faker::Lorem.characters(number: 40)

      patch :update, params: { person_id: saved_person.id,
                               id: saved_artwork.id,
                               artwork: { title: Faker::Lorem.characters(number: 40), description: new_desc, photo: file } }
      expect(response).to redirect_to(person_artwork_path(saved_person, saved_artwork))
      saved_artwork.reload
      expect(saved_artwork.description).to eq(new_desc)
    end
  end
end
