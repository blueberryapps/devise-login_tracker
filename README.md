# Devise::LoginTracker

LoginTracker is a gem that tracks logins of each user.

## Installation

Add this line to your application's Gemfile:

    gem 'devise-login_tracker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise-login_tracker

## Usage

Run the generator with the model name (User in this example):

    $ rails g devise_login_tracker User

Add `:login_tracker` to `devise` in your model and association
to the login records. Example for User model:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, ..... , :login_tracker

  has_many :logins, class_name: 'UserLogin'
end
```

## What is tracked

For each login new record is created with following attributes:

* `ip_address` - IP address
* `user_agent` - User agent
* `request_id` - Request ID (UUID)
* `signed_in_at` - Signed in at
* `signed_in_at` -  Signed out at (upon sign out)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
