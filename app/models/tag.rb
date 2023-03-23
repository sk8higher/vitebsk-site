# frozen_string_literal: true

class Tag < ApplicationRecord
  extend Mobility

  translates :name, type: :string, column_fallback: %i[ru]
end
