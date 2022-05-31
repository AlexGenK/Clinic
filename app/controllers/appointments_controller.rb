class AppointmentsController < ApplicationController
  before_action :set_doctor, only: [:new]

  def index
    @appointments = Appointment.order(:created_at) 
  end

  def new
    @appointment = @doctor.appointments.new(patient_id: current_user.id) 
    @appointment.save
    redirect_to appointments_path
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
end
