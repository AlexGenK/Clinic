class AppointmentsController < ApplicationController
  before_action :set_persons, only: [:index, :new, :destroy, :edit, :update]
  before_action :set_appointment, only: [:update, :destroy, :edit]
  load_and_authorize_resource

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
    redirect_to user_appointments_path(current_user)
  end

  def edit
  end

  def update
    @appointment.update(appointment_params ) 
    if (@appointment.recommendation != nil) || (@appointment.recommendation != '')
      @appointment.closed = true
      @appointment.save
    end
    redirect_to doctor_appointments_path(@doctor)
  end

  def destroy
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:recommendation)
  end

  def set_persons
    @doctor = Doctor.find_by(id: params[:doctor_id])
    @patient = Patient.find_by(id: params[:user_id])
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
