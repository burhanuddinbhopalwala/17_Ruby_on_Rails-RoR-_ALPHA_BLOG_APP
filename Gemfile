source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use Puma as the app server
gem 'puma', '~> 3.7'

# 1: Devise authentication system
# gem "devise"
# gem "devise-bootstrap-views"
=begin 
- Devise install steps
rails generate devise:install
rails generate devise User
=end 

# 2: jquey and twitter booststrap gem
# gem "jquery-rails"
# gem "twitter-bootstrap-rails"
=begin
- Twitter bootstrap install steps
rails generate bootstrap:install static
rails generate bootstrap:layout application
=end


# 1: Jquery rails for Rails 5 AND bootstrap-sass is a Sass-powered 
# version of Bootstrap 3, ready to drop right into your Sass powered 
# applications
gem "jquery-rails"
gem 'bootstrap-sass', '~> 3.3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# 2: Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# 3: for pagination
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # 4: Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # gem 'capistrano-rails' # Use Capistrano for deployment
end

# 5:
group :test do
  gem "rails-controller-testing"
end

#6: Add below production group gems 
group :production do
  gem "pg", '~> 0.11'
  # gem 'rails_12factor' # Not needed for Rails 5 onwards 
end 

=begin
7: bundle install --without production # And then do the final commit for 
Gemfile and Gemfile.lock before the Heroku deploy
=end 

=begin 
8: GEM install commands 
8.1: 
- gem update bundle 
- bundle install 
- bundle info <gem_name>

8.2:
- gem install <gem_name> # For installing gem seprately 
- gem uninstall <gem_name> # For removing a particular gem
- bundle update <gem_name> # For individual gem
- bundle update --all # Ignores the Gemfile.lock and update all the 
gems
=end 

=begin
9: Heroku deployment steps
- Install heroku toolbest for compatible OS
- heroku --version
- heroku # for list of heroku commands
- Make sure to be in rails project directory to run the below commands
- heroku login # enter the credentials 
- heroku keys:add # adding ssh for crenditial helper 
- heroku create # to create the production version of app on heroku
- git push heroku master 
- heroku rename <new_app_name>
- final URL: <new_app_name>.herokuapp.com

Note: Ensure you have committed all your local changes to your git 
repo prior to pushing to heroku by checking git status
=end 

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
