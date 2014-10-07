ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include Capybara::DSL
  Capybara.javascript_driver = :poltergeist
  # Add more helper methods to be used by all tests here...
end

def sign_in(user)
  visit sign_in_path
  fill_in 'Login', with: users(user).email
  fill_in 'Password', with: 'password'
  click_on 'Sign in'
end

