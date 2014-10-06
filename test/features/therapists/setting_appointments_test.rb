require 'test_helper'

feature 'setting appointments' do
  scenario 'therapist adds an appointment' do
    sign_in_therapist

    visit new_appointment_path
    fill_in 'Date', with: '10-24-2014'
    fill_in 'start-time', with: '3:00pm'
    fill_in 'end-time', with: '6:00pm'
    click_button 'Create appointment'
    page.must_have_content 'Appointment was successfully created.'
  end
end
