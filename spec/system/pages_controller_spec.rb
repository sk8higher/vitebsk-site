# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe PagesController do
  let(:categories_menu) { find(:css, '.dropdown-toggle') }

  def toggle_menu
    click_button(class: 'navbar-toggler') if find_button(class: 'navbar-toggler').present?
  end

  def toggle_categories_menu
    categories_menu.click
  end

  it 'shows page content' do
    visit root_path
    expect(page).to have_content I18n.t('pages.index.title')
  end

  describe '#header buttons' do
    before do
      visit root_path
    end

    it 'redirects to root after clicking on first navbar item' do
      toggle_menu
      click_link(I18n.t('header.home_link'))
      expect(page).to have_current_path(root_path)
    end

    it 'redirects to root after clicking on navbar icon' do
      find(:css, '.navbar-brand > img').click
      expect(page).to have_current_path(root_path(locale: I18n.default_locale))
    end

    it 'expands menu on click' do
      toggle_menu

      expect do
        toggle_categories_menu
      end.to change { categories_menu['aria-expanded'] }.from('false').to 'true'
    end

    describe 'categories menu' do
      before do
        toggle_menu
        toggle_categories_menu
      end

      def click_category_link(number)
        category_link = find(:xpath, "(//a[@class='dropdown-item'])[#{number}]")
        category_link.click
      end

      it 'redirects to buildings path on first link click' do
        click_category_link 1

        expect(page).to have_current_path(buildings_path(locale: I18n.default_locale))
      end

      it 'redirects to monument path on second link click' do
        click_category_link 2

        expect(page).to have_current_path(monuments_path(locale: I18n.default_locale))
      end

      it 'redirects to museums path on third link click' do
        click_category_link 3

        expect(page).to have_current_path(museums_path(locale: I18n.default_locale))
      end

      it 'redirects to people path on fourth link click' do
        click_category_link 4

        expect(page).to have_current_path(people_path(locale: I18n.default_locale))
      end
    end

    it 'redirects to new user session path after clicking last navbar button' do
      visit root_path
      toggle_menu

      click_link(I18n.t('header.admin_panel.new_session'))

      expect(page).to have_current_path(new_user_session_path(locale: I18n.default_locale))
    end
  end
end
