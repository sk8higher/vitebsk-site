require 'webdrivers'
require_relative '../rails_helper'

RSpec.describe PagesController do
  let(:categories_menu) { find(:css, '.dropdown-toggle') }

  def toggle_menu
    click_button(class: 'navbar-toggler') if find_button(class: 'navbar-toggler').present?
  end

  def toggle_categories_menu
    categories_menu.click
  end

  it 'should show page content' do
    visit root_path
    expect(page).to have_content 'Историческая справка'
  end

  describe '#header buttons' do
    it 'should redirect to root after clicking on first navbar item' do
      visit root_path
      toggle_menu
      click_link('Главная')
      expect(page).to have_current_path(root_path)
    end

    it 'should redirect to root after clicking on navbar icon' do
      visit root_path
      find(:css, '.navbar-brand > img').click
      expect(page).to have_current_path(root_path)
    end

    it 'should expand menu on click' do
      visit root_path
      toggle_menu

      expect {
        toggle_categories_menu
      }.to change { categories_menu['aria-expanded'] }.from('false').to 'true'
    end

    context 'categories menu' do
      before(:each) do
        visit root_path
        toggle_menu
        toggle_categories_menu
      end

      def click_category_link(number)
        category_link = find(:xpath, "(//a[@class='dropdown-item'])[#{number}]")
        category_link.click
      end

      it 'should redirect to buildings path on first link click' do
        click_category_link 1

        expect(page).to have_current_path(buildings_path)
      end

      it 'should redirect to monument path on second link click' do
        click_category_link 2

        expect(page).to have_current_path(monuments_path)
      end

      it 'should redirect to museums path on third link click' do
        click_category_link 3

        expect(page).to have_current_path(museums_path)
      end

      it 'should redirect to people path on fourth link click' do
        click_category_link 4

        expect(page).to have_current_path(people_path)
      end
    end
  end
end
