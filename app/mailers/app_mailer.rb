class AppMailer < ActionMailer
  def new_appointment_email(user, appointment)
    @user = user
    @appointment = appointment

    mail
    from: 'info@scheduler.com',
    to: user.email,
    subject: 'You set a new appointment'
  end
end
