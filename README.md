# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Handyman 

This program allows users to book appointments with registered technicians. Each technician has a category or specialty, name, about, phone number and address for the user to decide and ultimately book an appointment with. The users show page shows, their own booked appointments in which they can edit or cancel. A user can also sign up as a Manager. A manager can view all of the technicians appointements and edit the technician. 


## Installation

The following gems were used for this application:

```ruby
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'pry', '~> 0.12.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'thin'
gem 'omniauth'
gem 'omniauth-github'
gem 'dotenv-rails'
gem 'omniauth-facebook'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

To install these gems run:

    $ bundle install 



## Usage

After installing the gems that were used, in terminal run 'rails:db migrate' to create the database needed. Then run 'rails db:seed' for some seed data. Finally, run 'thin start --ssl' in terminal to start the HTTP server for our application and in Chrome browser navigate to 'https://localhost:3000'. 
Check password and username fields in db/seeds to log into existing users.

## Development

You can access the rails console by running 'rails c' in terminal and "ctrl+d" to exit. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Lyoung0789/handyman-finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.