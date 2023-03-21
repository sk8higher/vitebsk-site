# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def all_locales
    I18n.available_locales
  end
end
