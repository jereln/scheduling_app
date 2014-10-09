require 'test_helper'

feature 'editing appointments' do
  scenario 'therapist can edit appointments' do
    sign_in(:therapist)
    visit appointment_path(appointments(:available_appointment))
    click_link 'Edit'
    fill_in 'Date', with: '10/31/2014'
    click_button 'Update Appointment'
    page.must_have_content 'Appointment was successfully updated.'
  end

  scenario 'client cannot edit appointments' do
    sign_in(:client)
    visit edit_appointment_path(appointments(:available_appointment))
    page.must_have_content 'Make A Reservation'
  end
end
