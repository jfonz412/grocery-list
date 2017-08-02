ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user, remember_me: '0') # do not remember by default
  	post sessions_create_path, params: { session: { email: user.email, 
  									   password: 'pass123',
  									   remember_me: remember_me } }
  end
end
