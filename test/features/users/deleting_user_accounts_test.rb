require 'test_helper'

feature 'deleting user accounts' do
  scenario 'therapist deletes a user account' do
    sign_in(:therapist)
    visit client_list_path
    find('tbody tr:last').click_on 'Delete Client Account'
    page.wont_have_content 'jim smith'
  end
end
