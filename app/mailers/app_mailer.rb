class AppMailer < ActionMailer::Base
  def send_emails(user, appointment)
    if appointment.reserved == true
      send_reservation_emails(user, appointment)
    else
      if user.therapist?
        therapist_cancellation(user, appointment)
      else
        client_cancellation(user, appointment)
      end
    end
  end

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

  def therapist_cancellation_for_client(appointment)
    @appointment = appointment
    @user = User.find(appointment.cancelled_id)
    mail(
      from: 'info@scheduler.com',
      to: @user.email,
      subject: 'Apppointment cancellation notice'
      )
  end

  def send_reservation_emails(user, appointment)
    AppMailer.client_reservation_email(user, appointment).deliver
    AppMailer.therapist_reservation_email(appointment.therapist, appointment)
    .deliver
  end

  def therapist_cancellation(user, appointment)
    AppMailer.therapist_cancellation_for_client(appointment).deliver
    AppMailer.therapist_cancellation_for_therapist(user, appointment).deliver
  end

  def client_cancellation(user, appointment)
    AppMailer.client_cancellation_for_therapist(appointment
      .therapist, appointment).deliver
    AppMailer.client_cancellation_for_client(user, appointment).deliver
  end
end
