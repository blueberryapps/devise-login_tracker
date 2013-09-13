require 'devise' unless defined?(Devise)
require 'devise/login_tracer/version'
require 'devise/models/login_tracer'
require 'devise/hooks/login_tracer'

Devise.add_module :login_tracer, :model => 'devise/models/login_tracer'

