class ClinicalAnomaly < ApplicationRecord
  belongs_to :clinical_symptom
  belongs_to :first_form
end
