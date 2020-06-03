# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_02_202848) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applicants", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.date "birthdate"
    t.string "academic"
    t.string "description"
    t.string "experience"
    t.integer "user_id", null: false
    t.integer "feedback", default: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "head_profiles", force: :cascade do |t|
    t.integer "head_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["head_id"], name: "index_head_profiles_on_head_id"
  end

  create_table "heads", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_heads_on_email", unique: true
    t.index ["reset_password_token"], name: "index_heads_on_reset_password_token", unique: true
  end

  create_table "job_openings", force: :cascade do |t|
    t.string "letter"
    t.integer "status", default: 1
    t.integer "applicant_id", null: false
    t.integer "job_vacancy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_job_openings_on_applicant_id"
    t.index ["job_vacancy_id"], name: "index_job_openings_on_job_vacancy_id"
  end

  create_table "job_vacancies", force: :cascade do |t|
    t.string "title"
    t.string "job_description"
    t.string "desired_skills"
    t.string "income_range"
    t.string "job_level"
    t.date "deadline"
    t.string "area"
    t.integer "head_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["head_id"], name: "index_job_vacancies_on_head_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.integer "head_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_posts_on_applicant_id"
    t.index ["head_id"], name: "index_posts_on_head_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applicants", "users"
  add_foreign_key "job_openings", "applicants"
  add_foreign_key "job_openings", "job_vacancies"
  add_foreign_key "job_vacancies", "heads"
  add_foreign_key "posts", "applicants"
  add_foreign_key "posts", "heads"
end
