class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 

  def index
    @appointments = @doctor.appointments
  end

  def show
  end

  def new
    @users = User.all - @doctor.users
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_appointment
      @appointment = @doctor.appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_time, :user_id)
    end

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end