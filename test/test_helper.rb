ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'
require 'simplecov'
SimpleCov.start

module ActiveSupport
  class TestCase
    fixtures :all
    include Capybara::DSL
    Capybara.javascript_driver = :poltergeist

    def sign_in(user)
      visit sign_in_path
      fill_in 'Email or Username', with: users(user).email
      fill_in 'Password', with: 'password'
      click_on 'Sign In!'
    end
  end
end
