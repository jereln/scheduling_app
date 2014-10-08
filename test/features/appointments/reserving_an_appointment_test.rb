require 'test_helper'

feature 'reserving an appointment' do
  scenario 'client reserves an appointment' do
    sign_in(:client)

    visit appointment_path(appointments(:available_appointment))
    click_button 'Reserve Appointment'
    page.must_have_content 'Appoint succesfully updated.'
  end
end
