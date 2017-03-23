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

ActiveRecord::Schema.define(version: 20170320181108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "translator",             default: false, null: false
    t.boolean  "approver",               default: false, null: false
    t.boolean  "superuser",              default: false, null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "is_active",              default: true,  null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree
  end

  create_table "course_languages", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id"], name: "index_course_languages_on_course_id", using: :btree
    t.index ["language_id"], name: "index_course_languages_on_language_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sequential_id",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status",        default: 0
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_active",  default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "lesson_translations", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "language_id"
    t.text     "content"
    t.integer  "status",        default: 0
    t.integer  "sequential_id",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["language_id"], name: "index_lesson_translations_on_language_id", using: :btree
    t.index ["lesson_id"], name: "index_lesson_translations_on_lesson_id", using: :btree
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "sequential_id",             null: false
    t.integer  "subject_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status",        default: 0
    t.index ["subject_id"], name: "index_lessons_on_subject_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",                      null: false
    t.text     "description"
    t.integer  "sequential_id",             null: false
    t.integer  "course_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status",        default: 0
    t.index ["course_id"], name: "index_subjects_on_course_id", using: :btree
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "is_complete", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id", using: :btree
    t.index ["user_id"], name: "index_user_courses_on_user_id", using: :btree
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id", using: :btree
    t.index ["user_id"], name: "index_user_languages_on_user_id", using: :btree
  end

  create_table "user_lesson_progressions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.integer  "subject_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_lesson_progressions_on_course_id", using: :btree
    t.index ["lesson_id"], name: "index_user_lesson_progressions_on_lesson_id", using: :btree
    t.index ["subject_id"], name: "index_user_lesson_progressions_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_user_lesson_progressions_on_user_id", using: :btree
  end

  create_table "user_preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gender",               default: "N/A"
    t.string   "country_of_origin"
    t.string   "country_of_residence"
    t.boolean  "consent",              default: false,     null: false
    t.date     "age"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "delivery_time",        default: "morning"
    t.index ["user_id"], name: "index_user_preferences_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "phone_number",           default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "otp"
    t.datetime "otp_timestamp"
    t.datetime "otp_confirmed_at"
    t.integer  "phone_dial_code",        default: 1
    t.index ["otp"], name: "index_users_on_otp", unique: true, using: :btree
    t.index ["phone_number"], name: "index_users_on_phone_number", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "user_preferences", "users"
end
