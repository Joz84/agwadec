class Practitioner < ApplicationRecord
  has_many :consultations
  validates :name, presence: true
  validates :name, uniqueness: true
end
