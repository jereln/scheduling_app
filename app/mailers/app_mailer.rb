class AppMailer < ActionMailer
  def client_reservation_email(user, appointment)
    set_variables
    mail(
      from: 'info@scheduler.com',
      to: user.email,
      subject: 'Appointment reservaton confirmation'
      )
  end

  def therapist_reservation_email(user, appointment)
    set_variables
    mail(
      from: 'info@scheduler.com',
      to: user.email,
      subject: 'Appointment reservation notice'
      )
  end

  def client_cancellation_for_client(user, appointment)
   cancellation_confirmation
  end

  def client_cancellation_for_therapist(user, appointment)
    cancellation_notice
  end

  def therapist_cancellation_for_therapist(user, appointment)
    cancellation_confirmation
  end

  def therapist_cancellation_for_client(user, appointment)
    cancellation_notice
  end

  private

  def cancellation_confirmation(user, appointment)
    set_variables
    mail(
      from: 'info@scheduler.com'
      to: @user.email
      subject: 'Apppointment cancellation confirmation'
      )
  end

  def cancellation_notice
    set_variables
    mail(
      from: 'info@scheduler.com'
      to: @user.email
      subject: 'Apppointment cancellation notice'
      )
  end

  def set_variables
    @user = @user
    @appointment = appointment
  end
end











