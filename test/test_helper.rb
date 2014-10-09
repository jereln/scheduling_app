ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'

class ActiveSupport::TestCase
  fixtures :all
  include Capybara::DSL
  Capybara.javascript_driver = :poltergeist
end

def sign_in(user)
  visit sign_in_path
  fill_in 'Email', with: users(user).email
  fill_in 'Password', with: 'password'
  click_on 'Sign In!'
end

