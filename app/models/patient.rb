class Patient < ApplicationRecord
  has_many :sheet
  has_many :consultations
  has_many :practitioners, through: :consultations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
end
