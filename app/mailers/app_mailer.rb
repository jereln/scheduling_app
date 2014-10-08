class AppMailer < ActionMailer::Base
  def client_reservation_email(user, appointment)
    @user = user
    @appointment = appointment
    mail(
      from: 'info@scheduler.com',
      to: user.email,
      subject: 'Appointment reservaton confirmation'
      )
  end

  def therapist_reservation_email(user, appointment)
    @user = user
    @appointment = appointment
    mail(
      from: 'info@scheduler.com',
      to: user.email,
      subject: 'Appointment reservation notice'
      )
  end

  def client_cancellation_for_client(user, appointment)
    @user = user
    @appointment = appointment
    mail(
      from: 'info@scheduler.com',
      to: user.email,
      subject: 'Apppointment cancellation confirmation'
      )
  end

  def client_cancellation_for_therapist(user, appointment)
    @user = user
    @appointment = appointment
    mail(
      from: 'info@scheduler.com',
      to: appointment.therapist.email,
      subject: 'Apppointment cancellation notice'
      )
  end

  def therapist_cancellation_for_therapist(user, appointment)
    @user = user
    @appointment = appointment
    mail(
      from: 'info@scheduler.com',
      to: user.email,
      subject: 'Apppointment cancellation confirmation'
      )
  end

  def therapist_cancellation_for_client(user, appointment)
    @user = user
    @appointment = appointment
    mail(
      from: 'info@scheduler.com',
      to: appointment.client.email,
      subject: 'Apppointment cancellation notice'
      )
  end
end
