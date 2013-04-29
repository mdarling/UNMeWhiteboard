# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130316054159) do

  create_table "attendings", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.boolean  "cardiac_disease"
    t.boolean  "aortic_stenosis"
    t.boolean  "aoritic_regurg"
    t.boolean  "mitral_stenosis"
    t.boolean  "mitral_regurg"
    t.boolean  "vitral_valve_proalapse"
    t.boolean  "valve_replacement"
    t.boolean  "aortic_vr"
    t.boolean  "mitral_vr"
    t.boolean  "congential_heart_disease"
    t.boolean  "cong_hd_repair"
    t.boolean  "cardiomyopathy"
    t.boolean  "coronary_artery_disease"
    t.boolean  "pulmonary_hypertension"
    t.string   "cardiac_disease_free_text"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "patient_id"
    t.boolean  "airway"
    t.boolean  "chorioamnionitis"
    t.boolean  "macrosomia"
    t.boolean  "hemophilia"
    t.boolean  "atp"
    t.boolean  "ttp"
    t.boolean  "thrombocytopenia"
    t.boolean  "vw_disease"
    t.boolean  "factor_deficiency"
    t.string   "hemophilia_free_text"
    t.boolean  "thrombophilia"
    t.boolean  "antithrombin"
    t.boolean  "prot_c_deficiency"
    t.boolean  "prot_s_deficiency"
    t.boolean  "factor_v_leiden"
    t.boolean  "lupus_anticoag"
    t.string   "thrombophilia_free_text"
    t.boolean  "anticoag_meds"
    t.boolean  "diabetes"
    t.boolean  "gestational_diabetes"
    t.boolean  "gdma1"
    t.boolean  "gdma2"
    t.boolean  "type_1_diabetes"
    t.boolean  "type_2_diabetes"
    t.boolean  "multiple_gestation"
    t.boolean  "twins"
    t.boolean  "triplets"
    t.boolean  "placenta_previa"
    t.boolean  "placenta_accreta"
    t.boolean  "placenta_percreta"
    t.boolean  "prior_cs"
    t.string   "location_of_placenta"
    t.boolean  "placental_abruption"
    t.boolean  "polyhydramnios"
    t.boolean  "substance_abuse"
    t.string   "general_free_text"
    t.integer  "hep_sq_mg"
    t.datetime "hep_sq_when"
    t.integer  "hep_iv_mg"
    t.datetime "hep_iv_when"
    t.integer  "cs_times"
    t.boolean  "mild_pre"
    t.boolean  "sev_pre"
    t.integer  "pre_bp"
    t.integer  "pre_plat"
    t.datetime "pre_when"
    t.integer  "e_bp"
    t.integer  "e_plat"
    t.datetime "e_when"
    t.integer  "lmwh_mg"
    t.datetime "lmwh_when"
  end

  create_table "last_exams", :force => true do |t|
    t.datetime "exam_time"
    t.integer  "dilation"
    t.integer  "effacement"
    t.integer  "station"
    t.integer  "patient_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nurses", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "last_exam"
    t.integer  "current_dilation"
    t.integer  "current_effacement"
    t.integer  "current_station"
    t.string   "membrane"
    t.decimal  "est_gest_age"
    t.integer  "gravidity"
    t.integer  "parity"
    t.string   "group_b_strep"
    t.string   "blood_type"
    t.decimal  "body_mass_index"
    t.integer  "room_id"
    t.integer  "attending_id"
    t.integer  "nurse_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "anesthesia_interview"
  end

  create_table "rooms", :force => true do |t|
    t.string   "room_number"
    t.boolean  "room_occupied"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
