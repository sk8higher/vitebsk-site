require_relative '../rails_helper'
require 'faker'

RSpec.describe Person do
  let(:person) { create(:person) }

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
end
