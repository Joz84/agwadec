class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :sheet
  has_many :first_forms
end
