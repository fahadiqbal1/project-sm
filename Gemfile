source "https://rubygems.org"

ruby '2.4.0'

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
gem 'bootscale', :require => false
gem 'country_select' # https://github.com/stefanpenner/country_select
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails', groups: [:development, :test]
gem 'econfig', require: 'econfig/rails'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'intl-tel-input-rails'
gem 'meta-tags' # https://github.com/kpumuk/meta-tags
gem 'marco-polo' # https://github.com/arches/marco-polo
gem 'pickadate-rails' # https://github.com/veracross/pickadate-rails
gem 'secure_headers', '~> 3.0' # https://github.com/twitter/secureheaders
gem 'sidekiq'
gem 'sinatra', :require => false
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'tether-rails' #https://github.com/jakegavin/tether-rails
gem 'twilio-ruby'
gem 'textris'
# End Soul Medicine Gems


# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :production, :staging do
  gem 'postmark-rails'
  gem 'unicorn'
  gem 'unicorn-worker-killer'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  gem 'annotate' # https://github.com/ctran/annotate_models
  gem 'better_errors' # https://github.com/charliesome/better_errors
  gem 'binding_of_caller' # https://github.com/charliesome/better_errors
  gem 'brakeman', :require => false # https://github.com/presidentbeef/brakeman
  gem 'guard', '>= 2.2.2', :require => false # https://github.com/guard/guard
  gem 'guard-livereload', :require => false
  gem 'guard-minitest', :require => false
  gem 'guard-rails', require: false # https://github.com/ranmocy/guard-rails
  gem 'letter_opener' # https://github.com/ryanb/letter_opener
  gem 'overcommit', '>= 0.37.0', :require => false # https://github.com/brigade/overcommit
  gem 'rack-livereload' # https://github.com/johnbintz/rack-livereload
  gem 'rubocop', '>= 0.44.0', :require => false
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'xray-rails' # https://github.com/brentd/xray-rails
end

group :test do
  gem 'connection_pool'
  gem 'minitest-reporters'
  gem 'shoulda-context'
  gem 'shoulda-matchers', '>= 3.0.1'
end

