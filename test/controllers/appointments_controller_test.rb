require 'test_helper'

describe AppointmentsController do
  include Devise::TestHelpers

  describe 'DELETE destroy' do
    it 'will not delete the appointment when user is a client' do
      sign_in users(:client)
      delete :destroy, id: appointments(:available_appointment)
      appointments(:available_appointment).wont_be_nil
    end
  end
end
