require_relative '../rails_helper'
require 'faker'

RSpec.describe Museum do
  let(:museum) { create(:museum) }

  context 'model validations' do
    it { is_expected.to have_one_attached :photo }

    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(70) }

    it { is_expected.to validate_length_of(:description).is_at_least(5) }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:photo) }
  end

  describe 'model object validations' do
    it 'is valid with all attributes present' do
      expect(museum).to be_valid
    end

    context 'attribute presence' do
      it 'is not valid without photo' do
        museum.photo = nil
        expect(museum).not_to be_valid
      end

      it 'is not valid without name' do
        museum.name = nil
        expect(museum).not_to be_valid
      end

      it 'is not valid without description' do
        museum.description = nil
        expect(museum).not_to be_valid
      end
    end

    describe 'attribute length' do
      context 'name length validation' do
        it 'is not valid with a name less than 3 symbols' do
          museum.name = Faker::Lorem.characters(number: 2)
          expect(museum).not_to be_valid
        end

        it 'is not valid with a name greater than 70 symbols' do
          museum.name = Faker::Lorem.characters(number: 75)
          expect(museum).not_to be_valid
        end
      end

      context 'description length validation' do
        it 'is not valid with a name less than 5 symbols' do
          museum.description = Faker::Lorem.characters(number: 3)
          expect(museum).not_to be_valid
        end

        it 'is valid with any number of symbols greater than 5' do
          museum.description = Faker::Lorem.characters(number: 100)
          expect(museum).to be_valid
        end
      end
    end
  end
end
