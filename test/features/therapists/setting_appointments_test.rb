require 'test_helper'

feature 'setting appointments' do
  scenario 'therapist adds an appointment' do
    sign_in_therapist

    visit new_appointment_path
    fill_in 'Date', with: '10/21/14'
    fill_in 'Start time', with: '3:00pm'
    fill_in 'End time', with: '6:00pm'
    click_button 'Create Appointment'
    page.must_have_content 'Appointment was successfully created.'
  end

  scenario 'a client cannnot set an appointment' do
    sign_in_client

    visit new_appointment_path
    page.must_have_content 'Sign in'
  end

  scenario 'a client cannot see a New Appointment link' do
    sign_in_client

    visit appointments_path
    page.wont_have_content 'New Appointment'
  end
end
