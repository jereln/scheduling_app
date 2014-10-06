ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include Capybara::DSL

  # Add more helper methods to be used by all tests here...
end

def sign_in_therapist
  visit new_therapist_session_path
  fill_in 'Email', with: therapists(:therapist).email
  fill_in 'Password', with: 'password'
  click_on 'Sign in'
end
