require 'test_helper'

feature 'viewing client list' do
  scenario 'a therapist views the client list' do
    sign_in(:therapist)
    visit client_list_path
    page.must_have_content users(:client).full_name
  end

  scenario 'a client cannot view the client list' do
    sign_in(:client)
    visit client_list_path
    page.must_have_content 'October'
  end
end

feature 'viewing a user account' do
  scenario 'a client can view their own account' do
    sign_in(:client)
    visit account_path
    page.must_have_content users(:client).full_name
    page.must_have_content users(:client).client_appts.first.date
  end
end
