source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'jsbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record', '~> 2.1.0'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'simplecov', '~> 0.17'
  gem 'simplecov-lcov', '~> 0.8.0'
end

# Auth
gem 'cancancan'
gem 'devise'

# Pagination
gem 'pagy'

gem 'rubocop', '~> 1.48', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false

gem 'rails-i18n', '~> 7.0', '>= 7.0.6'

gem 'mobility', '~> 1.2', '>= 1.2.9'

gem "pg", "~> 1.5"
gem 'sqlite3'
