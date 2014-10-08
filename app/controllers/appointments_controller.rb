class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  def index
    @appointments = policy_scope(Appointment)
  end

  # GET /appointments/1
  def show
    authorize @appointment
    @user = current_user
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    authorize @appointment
  end

  # GET /appointments/1/edit
  def edit
    authorize @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      if @appointment.reserved == true
        send_reservation_emails
      else
        user.therapist? ? send_therapist_cancellation_emails : send_client_cancellation_emails
      end
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    authorize @appointment
    redirect_to appointments_url,
      notice: 'Appointment was successfully destroyed.'
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time, :reserved, :therapist_id, :client_id)
  end

  def send_reservation_emails
    AppMailer.client_reservation_email(current_user, @appointment).deliver
    AppMailer.therapist_reservation_email(
                                          @appointment.therapist,
                                          @appointment
                                          ).deliver
  end

  def send_therapist_cancellation_emails
    AppMailer.therapist_cancellation_for_client(
                                                @appointment.client,
                                                @appointment
                                                ).deliver
    AppMailer.therapist_cancellation_for_therapist(
                                                  current_user,
                                                   @appointment
                                                   ).deliver
  end

  def send_client_cancellation_emails
    AppMailer.client_cancellation_for_therapist(
                                                @appointment.therapist,
                                                @appointment
                                                ).deliver
    AppMailer.client_cancellation_for_client(
                                             current_user,
                                             @appointment
                                             ).deliver
  end
end
