require_relative '../rails_helper'
require 'faker'

RSpec.describe Monument do
  let(:monument) { create(:monument) }

  context 'model validations' do
    it { is_expected.to have_one_attached :photo }

    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(100) }

    it { is_expected.to validate_length_of(:description).is_at_least(5) }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:photo) }
  end

  describe 'model object validations' do
    it 'is valid with all attributes present' do
      expect(monument).to be_valid
    end

    context 'attribute presence' do
      it 'is not valid without photo' do
        monument.photo = nil
        expect(monument).not_to be_valid
      end

      it 'is not valid without name' do
        monument.name = nil
        expect(monument).not_to be_valid
      end

      it 'is not valid without description' do
        monument.description = nil
        expect(monument).not_to be_valid
      end
    end

    describe 'attribute length' do
      context 'name length validation' do
        it 'is not valid with a name less than 3 symbols' do
          monument.name = Faker::Lorem.characters(number: 2)
          expect(monument).not_to be_valid
        end

        it 'is not valid with a name greater than 100 symbols' do
          monument.name = Faker::Lorem.characters(number: 105)
          expect(monument).not_to be_valid
        end
      end

      context 'description length validation' do
        it 'is not valid with a name less than 5 symbols' do
          monument.description = Faker::Lorem.characters(number: 3)
          expect(monument).not_to be_valid
        end

        it 'is valid with any number of symbols greater than 5' do
          monument.description = Faker::Lorem.characters(number: 100)
          expect(monument).to be_valid
        end
      end
    end
  end
end
