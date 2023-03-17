require_relative '../rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  describe 'abilities' do
    subject(:ability) { described_class.new(user) }

    context 'when user is an admin' do
      let(:user) { create(:user, user_type: 'admin') }

      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'when user is not an admin' do
      let(:user) { create(:user) }

      it { is_expected.to be_able_to(:read, :all) }
      it { is_expected.not_to be_able_to(:manage, :all) }
    end
  end
end
