require_relative '../rails_helper'
require 'faker'

RSpec.describe Artwork do
  let(:tag) { create(:tag) }
  let(:person) { create(:person, tag_id: tag.id) }
  let(:artwork) { create(:artwork, person_id: person.id) }

  context 'model validations' do
    it { should have_one_attached :photo }
    it { should belong_to :person }

    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_length_of(:description).is_at_least(5) }

    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:title) }
  end

  describe 'model object validations' do
    it 'should be valid with all attributes present' do
      expect(artwork).to be_valid
    end

    context 'attribute presence' do
      it 'should be valid without photo' do
        artwork.photo = nil
        expect(artwork).to be_valid
      end

      it 'should not be valid without title' do
        artwork.title = nil
        expect(artwork).not_to be_valid
      end

      it 'should not be valid without description' do
        artwork.description = nil
        expect(artwork).not_to be_valid
      end

      it 'should not be valid without person id' do
        artwork.person_id = nil
        expect(artwork).not_to be_valid
      end
    end

    describe 'attribute length' do
      context 'title length validation' do
        it 'should not be valid with a title less than 3 symbols' do
          artwork.title = Faker::Lorem.characters(number: 2)
          expect(artwork).not_to be_valid
        end

        it 'should be valid with a title length greater than 3 symbols' do
          artwork.title = Faker::Lorem.characters(number: 150)
          expect(artwork).to be_valid
        end
      end

      context 'description length validation' do
        it 'should not be valid with a description less than 5 symbols' do
          artwork.description = Faker::Lorem.characters(number: 2)
          expect(artwork).not_to be_valid
        end

        it 'should be valid with a description length greater than 3 symbols' do
          artwork.description = Faker::Lorem.characters(number: 150)
          expect(artwork).to be_valid
        end
      end
    end
  end
end
