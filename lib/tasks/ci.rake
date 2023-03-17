unless Rails.env.production?
    require 'rspec/core/rake_task'
    require 'coveralls/rake/task'    
    Coveralls::RakeTask.new namespace :ci do
      desc 'Run all tests and generate a merged coverage report'
      task tests: [:spec, :system, :feature, 'coveralls:push']
    end
  end
