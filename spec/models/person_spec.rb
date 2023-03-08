require_relative '../rails_helper'
require 'faker'

RSpec.describe Person do
  let(:tag) { create(:tag) }
  let(:person) { create(:person, tag_id: tag.id) }

  context 'model validations' do
    it { should have_one_attached :photo }
    it { should have_many :artworks }
    it { should belong_to :tag }

    it { should validate_length_of(:name).is_at_least(3).is_at_most(70) }
    it { should validate_length_of(:bio).is_at_least(5) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:tag_id) }
  end

  describe 'model object validations' do
    it 'should be valid with all attributes present' do
      expect(person).to be_valid
    end

    context 'attribute presence' do
      it 'should not be valid without photo' do
        person.photo = nil
        expect(person).not_to be_valid
      end

      it 'should not be valid without name' do
        person.name = nil
        expect(person).not_to be_valid
      end

      it 'should not be valid without bio' do
        person.bio = nil
        expect(person).not_to be_valid
      end

      it 'should not be valid without tag id' do
        person.tag_id = nil
        expect(person).not_to be_valid
      end
    end

    describe 'attribute length' do
      context 'name length validation' do
        it 'should not be valid with a name less than 3 symbols' do
          person.name = Faker::Lorem.characters(number: 2)
          expect(person).not_to be_valid
        end

        it 'should not be valid with a name greater than 70 symbols' do
          person.name = Faker::Lorem.characters(number: 75)
          expect(person).not_to be_valid
        end
      end

      context 'bio length validation' do
        it 'should not be valid with a bio less than 3 symbols' do
          person.bio = Faker::Lorem.characters(number: 2)
          expect(person).not_to be_valid
        end

        it 'should be valid with a bio greater than 70 symbols' do
          person.bio = Faker::Lorem.characters(number: 75)
          expect(person).to be_valid
        end
      end
    end
  end
end
