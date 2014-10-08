class StaticPagesController < ApplicationController
  def home
    @appointments = policy_scope(Appointment)
    @appointments_by_date = @appointments.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
