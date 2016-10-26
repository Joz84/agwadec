class ReadingsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @sheet = Sheet.create(patient: @patient)
    @reading = Reading.create(user: current_user, sheet:@sheet)
    redirect_to history_path(@reading)
  end

end
