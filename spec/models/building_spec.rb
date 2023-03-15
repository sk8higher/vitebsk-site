require_relative '../rails_helper'

RSpec.describe Building do
  let(:building) { create(:building) }

  context 'model validations' do
    it { should have_one_attached :photo }

    it { should validate_length_of(:name).is_at_least(3).is_at_most(70) }

    it { should validate_length_of(:description).is_at_least(5) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:photo) }
  end

  describe 'model object validations' do
    it 'should be valid with all attributes present' do
      expect(building).to be_valid
    end

    context 'attribute presence' do
      it 'should not be valid without photo' do
        building.photo = nil
        expect(building).not_to be_valid
      end

      it 'should not be valid without name' do
        building.name = nil
        expect(building).not_to be_valid
      end

      it 'should not be valid without description' do
        building.description = nil
        expect(building).not_to be_valid
      end
    end

    describe 'attribute length' do
      context 'name length validation' do
        it 'should not be valid with a name less than 3 symbols' do
          building.name = Faker::Lorem.characters(number: 2)
          expect(building).not_to be_valid
        end

        it 'should not be valid with a name greater than 70 symbols' do
          building.name = Faker::Lorem.characters(number: 75)
          expect(building).not_to be_valid
        end
      end

      context 'description length validation' do
        it 'should not be valid with a description less than 5 symbols' do
          building.description = Faker::Lorem.characters(number: 3)
          expect(building).not_to be_valid
        end

        it 'should be valid with any number of symbols greater than 5' do
          building.description = Faker::Lorem.characters(number: 100)
          expect(building).to be_valid
        end
      end
    end
  end
end
