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

ActiveRecord::Schema.define(version: 2020_08_03_080716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "side_job_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["side_job_id"], name: "index_comments_on_side_job_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
  end

  create_table "main_jobs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "company"
    t.string "section"
    t.string "industry"
    t.string "medium"
    t.string "occupation"
    t.date "started_at"
    t.date "ended_at"
    t.integer "worktime_week", null: false
    t.integer "income_month"
    t.text "description"
    t.integer "work_type"
    t.index ["user_id"], name: "index_main_jobs_on_user_id"
  end

  create_table "side_jobs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "main_job_id", null: false
    t.text "pulled_skill"
    t.text "returned_skill"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "company"
    t.string "section"
    t.string "industry"
    t.string "medium"
    t.string "occupation"
    t.date "started_at"
    t.date "ended_at"
    t.integer "worktime_week", null: false
    t.integer "income_month"
    t.text "description", null: false
    t.integer "work_type"
    t.index ["main_job_id"], name: "index_side_jobs_on_main_job_id"
    t.index ["user_id"], name: "index_side_jobs_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "importance_for_side_job"
    t.integer "importance_for_main_job"
    t.bigint "side_job_id"
    t.index ["name"], name: "index_skills_on_name"
    t.index ["side_job_id"], name: "index_skills_on_side_job_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "side_job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["side_job_id"], name: "index_stocks_on_side_job_id"
    t.index ["user_id", "side_job_id"], name: "index_stocks_on_user_id_and_side_job_id", unique: true
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.date "birthday"
    t.string "living_place"
    t.string "profile"
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
  add_foreign_key "main_jobs", "users"
  add_foreign_key "side_jobs", "main_jobs"
  add_foreign_key "side_jobs", "users"
  add_foreign_key "skills", "side_jobs"
  add_foreign_key "stocks", "side_jobs"
  add_foreign_key "stocks", "users"
end
