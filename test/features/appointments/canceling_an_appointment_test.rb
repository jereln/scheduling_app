require 'test_helper'

feature 'canceling an appointment' do
  scenario 'a therapist can cancel any appointment' do
    sign_in(:therapist)
    visit appointment_path(appointments(:reserved_appointment))
    click_button 'Cancel Appointment'
    page.wont_have_content appointments(:reserved_appointment).date
  end

  scenario 'a client can cancel their own appointment' do
    sign_in(:client)
    visit account_path(users(:client))
    click_button 'Cancel appointment'
    page.wont_have_content 'Date'
  end

  scenario 'a client cannot cancel another client appointment' do
    sign_in(:client)
    visit account_path(users(:client2))
    page.wont_have_content users(:client2).full_name
  end
end
