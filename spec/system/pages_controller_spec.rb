require 'webdrivers'
require_relative '../rails_helper'

RSpec.describe PagesController do
  it 'should show page content' do
    visit '/'
    expect(page).to have_content 'Историческая справка'
  end
end
