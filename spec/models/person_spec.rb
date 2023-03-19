# frozen_string_literal: true

require_relative '../rails_helper'
require 'faker'

RSpec.describe Person do
  let(:tag) { create(:tag) }
  let(:person) { create(:person, tag_id: tag.id) }

  describe 'model validations' do
    it { is_expected.to have_one_attached :photo }
    it { is_expected.to have_many :artworks }
    it { is_expected.to belong_to :tag }

    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(70) }
    it { is_expected.to validate_length_of(:bio).is_at_least(5) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:bio) }
    it { is_expected.to validate_presence_of(:photo) }
  end

  describe 'model object validations' do
    it 'is valid with all attributes present' do
      expect(person).to be_valid
    end

    describe 'attribute presence' do
      it 'is not valid without photo' do
        person.photo = nil
        expect(person).not_to be_valid
      end

      it 'is not valid without name' do
        person.name = nil
        expect(person).not_to be_valid
      end

      it 'is not valid without bio' do
        person.bio = nil
        expect(person).not_to be_valid
      end

      it 'is not valid without tag id' do
        person.tag_id = nil
        expect(person).not_to be_valid
      end
    end

    describe 'attribute length' do
      describe 'name length validation' do
        it 'is not valid with a name less than 3 symbols' do
          person.name = Faker::Lorem.characters(number: 2)
          expect(person).not_to be_valid
        end

        it 'is not valid with a name greater than 70 symbols' do
          person.name = Faker::Lorem.characters(number: 75)
          expect(person).not_to be_valid
        end
      end

      describe 'bio length validation' do
        it 'is not valid with a bio less than 3 symbols' do
          person.bio = Faker::Lorem.characters(number: 2)
          expect(person).not_to be_valid
        end

        it 'is valid with a bio greater than 70 symbols' do
          person.bio = Faker::Lorem.characters(number: 75)
          expect(person).to be_valid
        end
      end
    end
  end
end
