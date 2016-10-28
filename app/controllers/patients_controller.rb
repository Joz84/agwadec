class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to generalist_path(@patient)
    else
      render :new
    end
  end

  def patient_params
    params.require(:patient).permit(
    :first_name,
    :last_name,
    :maiden_name,
    :birth_date,
    :phone1,
    :phone2,
    :address,
    :city,
    :zip_code,
    :health_insurance,
    :social_security_number,
      )
  end
end
