require_relative '../rails_helper'

RSpec.describe PagesController do
  it 'should get index' do
    get :index
    assert_response :success
  end
end
