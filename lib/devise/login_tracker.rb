require 'devise' unless defined?(Devise)
require 'devise/login_tracker/version'
require 'devise/hooks/login_tracker'
require 'devise/models/login_tracker'

Devise.add_module :login_tracker, :model => 'devise/models/login_tracker'

