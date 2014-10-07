require 'test_helper'

feature 'viewing appointments' do
  scenario 'a therapist views all appointments' do
    sign_in_therapist
    visit appointments_path
    page.must_have_content appointments(:reserved_appointment).date
    page.must_have_content appointments(:available_appointment).date
  end
end
