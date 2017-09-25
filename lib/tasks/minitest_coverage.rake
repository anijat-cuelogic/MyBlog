require 'simplecov'
require 'factory_girl_rails'


namespace :minitest_coverage  do
  # task :minitest => 'ci:setup:minitest'

  task :coverage do
    SimpleCov.start 'rails' # feel free to pass block
    Rake::Task["test"].execute
  end

end
