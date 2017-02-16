source 'https://rubygems.org'
ruby "2.4.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0'
gem 'pg' # Use postgres as the database for Active Record
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'thor', '0.19.1' # http://stackoverflow.com/questions/41207432/expected-string-default-value-for-jbuilder-got-true-boolean-error-in-a
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.

# Heroku Deploy
gem 'rails_12factor', group: :production
gem 'passenger', group: :production

# Soul Medicine Gems
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'devise'
gem 'dotenv-rails', groups: [:development, :test]
gem "econfig", require: "econfig/rails"
gem 'font-awesome-sass', '~> 4.7.0'
gem 'intl-tel-input-rails'
gem 'sidekiq'
gem 'sinatra', :require => false
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'tether-rails' #https://github.com/jakegavin/tether-rails
gem 'twilio-ruby'
gem 'textris'
# End Soul Medicine Gems


# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

