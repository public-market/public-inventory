source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'jsonapi-utils'

gem 'rails', '~> 5.2.beta'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'

group :development do
  gem 'byebug'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot'
  gem 'ffaker'
  gem 'spree', github: 'spark-solutions/spree', branch: 'rails-5-2-test'
  # gem 'spree_auth_devise', path: '../spree_auth_devise'
  # gem 'spree_multi_vendor', github: 'public-market/spree_multi_vendor'
  gem 'database_cleaner'
  gem 'coffee-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
