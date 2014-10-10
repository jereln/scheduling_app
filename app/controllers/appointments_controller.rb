class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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
      AppMailer.send_emails(current_user, @appointment) unless request
      .referer.include?('/edit')
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      redirect_to @appointment, notice: 'Reservation time cannot be empty'
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    authorize @appointment
    redirect_to appointments_url,
                notice: 'Appointment was successfully deleted.'
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :start_time, :end_time,
                                        :reserved, :therapist_id, :client_id,
                                        :reservation_time, :cancelled_id)
  end
end
