class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  def index
    @appointments = policy_scope(Appointment)
  end

  # GET /appointments/1
  def show
    authorize @appointment
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
    authorize @appointment
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    authorize @appointment
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:date, :start_time, :end_time)
    end
end
