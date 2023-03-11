require_relative '../rails_helper'

RSpec.describe PagesController do
  it 'should get index' do
    get :index
    assert_response :success
  end

  it 'should show page content' do
    visit root_path
    expect(page).to have_content 'Историческая справка'
  end
end
