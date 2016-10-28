class PractitionersController < ApplicationController
  before_action :find_patient, only: [ :generalist, :gynecologist, :create ]
  before_action :new_practitioner, only: [ :generalist, :gynecologist ]

  def generalist
    session["practitioner"] = :generalist
  end

  def gynecologist
    session["practitioner"] = :gynecologist
  end


  def create
    @practitioner = Practitioner.new(practitioner_params)
    if @practitioner.save
      Consultation.create(patient: @patient, practitioner: @practitioner)
      if @practitioner.speciality == "generalist"
        redirect_to gynecologist_path(@patient)
      else
        redirect_to new_patient_reading_path(@patient)
      end
    else
      render session["practitioner"]
    end
  end

  private

  def find_patient
    @patient = Patient.find(params[:patient_id])
  end

  def new_practitioner
    @practitioner = Practitioner.new
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
