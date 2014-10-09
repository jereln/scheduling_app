require 'test_helper'

feature 'reserving an appointment' do
  scenario 'client reserves an available appointment' do
    sign_in(:client)
    visit appointment_path(appointments(:available_appointment))
    click_button 'Reserve Appointment'
    page.must_have_content 'Appointment was successfully updated.'
  end
end
