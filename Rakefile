# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'spree/testing_support/common_rake'

Rails.application.load_tasks

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'rails'
  Rake::Task['common:test_app'].invoke #("Spree::User")
end
