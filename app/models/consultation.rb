class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :practitioner
end
