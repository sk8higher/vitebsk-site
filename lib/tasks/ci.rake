require 'rspec/core/rake_task'
require 'coveralls/rake/task'

namespace :ci do
  desc 'Run all tests and generate a merged coverage report'
  task tests: [:spec, :system, :feature, 'coveralls:push']
end

RSpec::Core::RakeTask.new(:spec)
RSpec::Core::RakeTask.new(:system)
RSpec::Core::RakeTask.new(:feature)

task default: %w[spec system feature]
