require 'test_helper'

feature 'deleting an appointment' do
  before do
    sign_in(:therapist)
  end

  scenario 'a therapist deletes an appointment' do
    visit appointment_path(appointments(:available_appointment))
    click_button 'Delete Appointment'
    page.must_have_content 'Listing appointments'
  end

  scenario 'a therapist cannot delete a reserved appointment' do
    visit appointment_path(appointments(:reserved_appointment))
    page.wont_have_content 'Delete Appointment'
  end
end
