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

ActiveRecord::Schema.define(version: 2020_07_23_060845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "name", null: false
    t.string "work_type"
    t.string "section"
    t.string "industry"
    t.string "medium"
    t.string "occupation"
    t.date "started_at"
    t.date "ended_at"
    t.integer "worktime_week", null: false
    t.text "description", null: false
    t.text "pulled_skill", null: false
    t.text "returned_skill", null: false
    t.boolean "is_main", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "company"
    t.index ["name"], name: "index_jobs_on_name"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "importance_for_side_job"
    t.integer "importance_for_main_job"
    t.bigint "job_id"
    t.index ["job_id"], name: "index_skills_on_job_id"
    t.index ["name"], name: "index_skills_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.date "birthday", null: false
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

  add_foreign_key "jobs", "users"
end
