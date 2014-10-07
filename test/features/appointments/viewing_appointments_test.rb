require 'test_helper'

feature 'viewing appointments' do
  scenario 'a therapist can view all appointments' do
    sign_in_therapist
    visit appointments_path
    page.must_have_content appointments(:reserved_appointment).date
    page.must_have_content appointments(:available_appointment).date
  end

  scenario 'a therapist can view the show page for all appointments' do
    sign_in_therapist
    visit appointment_path(appointments(:reserved_appointment))

    page.must_have_content clients(:client).name
  end

  scenario 'a client can only see available appointments in the appointments index' do
    sign_in_client
    visit appointments_path
    page.must_have_content appointments(:available_appointment).date
    page.wont_have_content appointments(:reserved_appointment).date
  end

  scenario "a client cannot view another client's appointment" do
    sign_in_client
    visit appointment_path(appointments(:new_appointment))
    page.must_have_content 'Listing appointments'
  end

  scenario 'a client can view their own appointment' do
    sign_in_client
    visit appointment_path(appointments(:reserved_appointment))
    page.must_have_content clients(:client).name
  end

  scenario 'a client can see an available appointment show page' do
    sign_in_client
    visit appointment_path(appointments(:available_appointment))
    page.must_have_content appointments(:available_appointment).end_time
  end
end
