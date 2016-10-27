# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clinical_symptoms = [
  "Mammectomie",
  "Cicatrice",
  "Naevus ou autre formation cutanée",
  "Ulcération",
  "Rétractation du mamelon",
  "Rétractation cutanée ou méplat",
  "Inflammation",
  "Lésion eczématiforme du mamelon",
  "Écoulement anormal",
  "Tuméfaction",
  "Adénopathie(s)"
  ]

clinical_symptoms.each do |s|
  ClinicalSymptom.create(name: s)
end
