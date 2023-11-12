# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe ApplicationHelper do
  describe '#all_locales' do
    it 'returns all available locales' do
      expect(helper.all_locales).to eq(I18n.available_locales)
    end
  end
end
