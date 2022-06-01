class AppointmentsController < ApplicationController
  before_action :set_persons, only: [:index, :new]

  def index
    if @doctor == nil
      @appointments = @patient.appointments.order(created_at: 'desc')
    else
      @appointments = @doctor.appointments.order(created_at: 'desc')
    end 
  end

  def new
    @appointment = @doctor.appointments.new(patient_id: current_user.id) 
    @appointment.save
    redirect_to appointments_path
  end

  def edit
  end

  def update
  end

  private

  def appointment_params
    params.require(:appiontment).permin(:recommendation)
  end

  def set_persons
    @doctor = Doctor.find_by(id: params[:doctor_id])
    @patient = Patient.find_by(id: params[:user_id])
  end
end
