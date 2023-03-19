# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe PagesController do
  it 'gets index' do
    get :index
    assert_response :success
  end
end
