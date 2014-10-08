require 'test_helper'

class AppMailerTest < ActionMailer::TestCase
  test "reservation to client" do
    email = AppMailer.client_reservation_email(users(:client),
                                            appointments(:reserved_appointment)
                                            ).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['info@scheduler.com'], email.from
    assert_equal ['felipe@example.com'], email.to
    assert_equal 'Appointment reservaton confirmation', email.subject
  end

  test "reservation to therapist" do
    email = AppMailer.therapist_reservation_email(users(:therapist),
                                            appointments(:reserved_appointment)
                                            ).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['info@scheduler.com'], email.from
    assert_equal ['mary@example.com'], email.to
    assert_equal 'Appointment reservation notice', email.subject
  end

  test "client cancelation to client" do
    email = AppMailer.client_cancellation_for_client(users(:client),
                                            appointments(:reserved_appointment)
                                            ).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['info@scheduler.com'], email.from
    assert_equal ['felipe@example.com'], email.to
    assert_equal 'Apppointment cancellation confirmation', email.subject
  end

  test "client cancelation to therapist" do
    email = AppMailer.client_cancellation_for_therapist(users(:client),
                                            appointments(:reserved_appointment)
                                            ).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['info@scheduler.com'], email.from
    assert_equal ['mary@example.com'], email.to
    assert_equal 'Apppointment cancellation notice', email.subject
  end

  test "therapist cancelation to therapist" do
    email = AppMailer.therapist_cancellation_for_therapist(users(:therapist),
                                            appointments(:reserved_appointment)
                                            ).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['info@scheduler.com'], email.from
    assert_equal ['mary@example.com'], email.to
    assert_equal 'Apppointment cancellation confirmation', email.subject
  end

  test "therapist cancelation to client" do
    email = AppMailer.therapist_cancellation_for_client(users(:therapist),
                                            appointments(:reserved_appointment)
                                            ).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['info@scheduler.com'], email.from
    assert_equal ['felipe@example.com'], email.to
    assert_equal 'Apppointment cancellation notice', email.subject
  end
end
