class FirstFormsController < ApplicationController
  def history
    @reading = Reading.find(params[:reading_id])
    @first_form = FirstForm.new
    session["method"] = :history
  end

  def create
    @first_form = FirstForm.new(first_form_params)
    if @first_form.save
      redirect_to root_path
    else
      render session["method"]
    end
  end

  def patient_params
    params.require(:first_form).permit(
    :mammography_type,
    :mammography_system,
    :past_mammography,
    :past_mammography_date,
    :past_operation,
    :past_operation_date,
    :past_operation_reason,
    :family_history,
    :family_member,
    :hormonal_treatment,
    :clinical_examen_refusal,
    :normal_right,
    :normal_left,
    :abnormal_right,
    :abnormal_left,
    :technical_difficulty,
    :cad,
    :additional_impact,
    :normal_mammography,
    :echography_suspect,
    :echography_suspect_description,
    :abnormal_mammography_refusal,
    :radio_anomaly,
    :clinical_anomaly,
    :zoom,
    :echography,
    :cytoponction,
      )
  end
end
