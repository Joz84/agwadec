class PractitionersController < ApplicationController

  def generalist
    @patient = Patient.find(params[:patient_id])
    @practitioner = Practitioner.new
  end

  def gynecologist
    @patient = Patient.find(params[:patient_id])
    @practitioner = Practitioner.new
  end


  def create
    @patient = Patient.find(params[:patient_id])
    @practitioner = Practitioner.new(practitioner_params)
    if @practitioner.save
      Consultation.create(patient: @patient, practitioner: @practitioner)
      if @practitioner.speciality == "generalist"
        redirect_to gynecologist_path(@patient)
      else
        redirect_to new_patient_reading_path(@patient)
      end
    else
      render :generalist
    end
  end

  def practitioner_params
    params.require(:practitioner).permit(
    :name,
    :speciality,
    :address,
    :city,
    :zip_code,
      )
  end
end
