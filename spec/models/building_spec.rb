require_relative '../rails_helper'

RSpec.describe Building do
  let(:building) { create(:building)}

  context 'model validations' do
    it { should have_one_attached :photo }

    it { should validate_length_of(:name).is_at_least(3).is_at_most(70) }

    it { should validate_length_of(:description).is_at_least(5) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:photo) }
  end

  context 'model object validations' do
    it 'should be valid with all attributes present' do
      expect(building).to be_valid
    end
  end
end
