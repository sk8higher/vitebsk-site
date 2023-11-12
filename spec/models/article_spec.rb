# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  let(:article) { create(:article) }

  describe 'model validations' do
    it { is_expected.to have_many_attached :images }

    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(250) }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:images) }
  end

  describe 'model object validations' do
    it 'is valid with all attributes present' do
      expect(article).to be_valid
    end

    describe 'attribute presence' do
      it 'is not valid without an image' do
        article.images = nil
        expect(article).not_to be_valid
      end

      it 'is not valid without name' do
        article.name = nil
        expect(article).not_to be_valid
      end
    end

    describe 'attribute length' do
      describe 'name length validation' do
        it 'is not valid with a name less than 3 symbols' do
          article.name = Faker::Lorem.characters(number: 2)
          expect(article).not_to be_valid
        end

        it 'is not valid with a name greater than 250 symbols' do
          article.name = Faker::Lorem.characters(number: 255)
          expect(article).not_to be_valid
        end
      end
    end
  end
end
