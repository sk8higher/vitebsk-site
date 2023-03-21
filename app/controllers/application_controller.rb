# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Internationalization
end
