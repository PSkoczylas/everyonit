# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_29_164502) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "specialist_ads", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.integer "desired_salary"
    t.string "portfolio_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_specialist_ads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.text "description"
    t.string "main_specialization"
    t.string "title"
    t.string "repository_link"
    t.integer "current_level"
    t.integer "desired_level"
    t.integer "desired_salary"
    t.integer "account_type", default: 0
    t.integer "open_for_job", default: 0
    t.boolean "looking_for_mentor"
    t.boolean "open_for_mentorship"
    t.boolean "open_for_project_to_learn"
    t.boolean "is_anonymous", default: false
    t.boolean "has_own_company"
    t.datetime "date_added_open_for_job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "specialist_ads", "users"
end
