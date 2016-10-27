class ClinicalAnomaliesController < ApplicationController
  def index
    @reading = Reading.find(params[:reading_id])
    @first_form = FirstForm.find(params[:first_form_id])
    symptoms = ClinicalSymptom.all
    @symptoms = Hash.new
    symptoms.each do |s|
      a = ClinicalAnomaly.find_by(clinical_symptom: s)
      @symptoms[s.name] = a ? a.position : nil
    end
  end

  def breasts
    name = breasts_params[:selected]
    @symptom = ClinicalSymptom.find_by(name: name )
    @reading = Reading.find(params[:reading_id])
    @first_form = FirstForm.find(params[:first_form_id])
    @anomaly = ClinicalAnomaly.create(clinical_symptom: @symptom, first_form: @first_form )
  end

  def position
    @anomaly = ClinicalAnomaly.find(params[:clinical_anomaly_id])
    @anomaly.position = position_params[:selected]
    @anomaly.save
    redirect_to reading_first_form_clinical_anomalies_path(@anomaly.first_form.reading, @anomaly.first_form)
  end

  def delete
  end

  def breasts_params
    params.require(:symptom).permit!
  end

  def position_params
    params.require(:position).permit!
  end

end
