require_relative '../rails_helper'
require 'faker'

RSpec.describe Monument do
  let(:monument) { create(:monument) }

  context 'model validations' do
    it { should have_one_attached :photo }

    it { should validate_length_of(:name).is_at_least(3).is_at_most(100) }

    it { should validate_length_of(:description).is_at_least(5) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:photo) }
  end

  describe 'model object validations' do
    it 'should be valid with all attributes present' do
      expect(monument).to be_valid
    end

    context 'attribute presence' do
      it 'should not be valid without photo' do
        monument.photo = nil
        expect(monument).not_to be_valid
      end

      it 'should not be valid without name' do
        monument.name = nil
        expect(monument).not_to be_valid
      end

      it 'should not be valid without description' do
        monument.description = nil
        expect(monument).not_to be_valid
      end
    end

    describe 'attribute length' do
      context 'name length validation' do
        it 'should not be valid with a name less than 3 symbols' do
          monument.name = Faker::Lorem.characters(number: 2)
          expect(monument).not_to be_valid
        end

        it 'should not be valid with a name greater than 100 symbols' do
          monument.name = Faker::Lorem.characters(number: 105)
          expect(monument).not_to be_valid
        end
      end

      context 'description length validation' do
        it 'should not be valid with a name less than 5 symbols' do
          monument.description = Faker::Lorem.characters(number: 3)
          expect(monument).not_to be_valid
        end

        it 'should be valid with any number of symbols greater than 5' do
          monument.description = Faker::Lorem.characters(number: 100)
          expect(monument).to be_valid
        end
      end
    end
  end
end