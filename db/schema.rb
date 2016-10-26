# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161026131908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinical_anomalies", force: :cascade do |t|
    t.integer  "clinical_symptom_id"
    t.integer  "first_form_id"
    t.string   "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["clinical_symptom_id"], name: "index_clinical_anomalies_on_clinical_symptom_id", using: :btree
    t.index ["first_form_id"], name: "index_clinical_anomalies_on_first_form_id", using: :btree
  end

  create_table "clinical_symptoms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultations", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "practitioner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["patient_id"], name: "index_consultations_on_patient_id", using: :btree
    t.index ["practitioner_id"], name: "index_consultations_on_practitioner_id", using: :btree
  end

  create_table "first_forms", force: :cascade do |t|
    t.integer  "reading_id"
    t.string   "mammography_type"
    t.string   "mammography_system"
    t.boolean  "past_mammography"
    t.date     "past_mammography_date"
    t.boolean  "past_operation"
    t.date     "past_operation_date"
    t.string   "past_operation_reason"
    t.boolean  "family_history"
    t.string   "family_member"
    t.boolean  "hormonal_treatment"
    t.boolean  "clinical_examen_refusal"
    t.boolean  "normal_right"
    t.boolean  "normal_left"
    t.boolean  "abnormal_right"
    t.boolean  "abnormal_left"
    t.boolean  "technical_difficulty"
    t.boolean  "cad"
    t.boolean  "additional_impact"
    t.boolean  "normal_mammography"
    t.boolean  "echography_suspect"
    t.text     "echography_suspect_description"
    t.boolean  "abnormal_mammography_refusal"
    t.string   "radio_anomaly"
    t.string   "clinical_anomaly"
    t.boolean  "zoom"
    t.boolean  "echography"
    t.boolean  "cytoponction"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["reading_id"], name: "index_first_forms_on_reading_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "maiden_name"
    t.date     "birth_date"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "health_insurance"
    t.integer  "social_security_number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "practitioners", force: :cascade do |t|
    t.string   "name"
    t.string   "speciality"
    t.string   "address"
    t.string   "city"
    t.integer  "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radio_symptoms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_readings_on_sheet_id", using: :btree
    t.index ["user_id"], name: "index_readings_on_user_id", using: :btree
  end

  create_table "second_forms", force: :cascade do |t|
    t.integer  "reading_id"
    t.boolean  "layout_type"
    t.boolean  "insufficient_layout"
    t.boolean  "layout_position"
    t.boolean  "layout_quality"
    t.boolean  "mammography_quality"
    t.boolean  "layout_reprint"
    t.boolean  "other"
    t.string   "layout_description"
    t.boolean  "recommended_profil"
    t.boolean  "recommended_localisatio"
    t.boolean  "recommended_layout"
    t.boolean  "recoomended_zoom"
    t.boolean  "recommended_echo"
    t.text     "recommendation_description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["reading_id"], name: "index_second_forms_on_reading_id", using: :btree
  end

  create_table "sheets", force: :cascade do |t|
    t.integer  "patient_id"
    t.string   "reference_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id"], name: "index_sheets_on_patient_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "clinical_anomalies", "clinical_symptoms"
  add_foreign_key "clinical_anomalies", "first_forms"
  add_foreign_key "consultations", "patients"
  add_foreign_key "consultations", "practitioners"
  add_foreign_key "first_forms", "readings"
  add_foreign_key "readings", "sheets"
  add_foreign_key "readings", "users"
  add_foreign_key "second_forms", "readings"
  add_foreign_key "sheets", "patients"
end
