require_relative '../rails_helper'

RSpec.describe Building do
  context 'model validations' do
    it { should have_one_attached :photo }

    it { should validate_length_of(:name).is_at_least(3).is_at_most(70) }

    it { should validate_length_of(:description).is_at_least(5) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:photo) }
  end

  context 'model object validations' do
    # it 'should be invalid when just instantiated' do
    #   building = create(:building)
    #   expect(building).not_to be_valid
    # end

    it 'should be invalid with no name provided' do

    end
  end
end
