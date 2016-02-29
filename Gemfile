source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'devise'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'

# Use Unicorn as the app server
gem 'unicorn'
gem 'rack-timeout'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'sqlite3'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl', '~> 4.0'
  gem 'database_cleaner'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

