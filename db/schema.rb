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

ActiveRecord::Schema.define(version: 2020_12_27_152039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "survey_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "question"
    t.uuid "surveys_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["surveys_id"], name: "index_survey_questions_on_surveys_id"
  end

  create_table "survey_response_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "session_id"
    t.string "user_id"
    t.uuid "survey_id", null: false
    t.uuid "survey_response_id", null: false
    t.uuid "survey_question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_survey_response_users_on_session_id"
    t.index ["survey_id"], name: "index_survey_response_users_on_survey_id"
    t.index ["survey_question_id"], name: "index_survey_response_users_on_survey_question_id"
    t.index ["survey_response_id"], name: "index_survey_response_users_on_survey_response_id"
    t.index ["user_id"], name: "index_survey_response_users_on_user_id"
  end

  create_table "survey_responses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "response"
    t.uuid "surveys_id", null: false
    t.uuid "survey_questions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_questions_id"], name: "index_survey_responses_on_survey_questions_id"
    t.index ["surveys_id"], name: "index_survey_responses_on_surveys_id"
  end

  create_table "surveys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tittle"
    t.datetime "begin_datetime"
    t.datetime "end_datetime"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_surveys_on_slug", unique: true
  end

  create_table "users", id: :uuid, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "password_hash", limit: 255
    t.datetime "inserted_at", precision: 0, null: false
    t.datetime "updated_at", precision: 0, null: false
    t.index ["email"], name: "unique_email", unique: true
  end

  add_foreign_key "survey_questions", "surveys", column: "surveys_id"
  add_foreign_key "survey_response_users", "survey_questions"
  add_foreign_key "survey_response_users", "survey_responses"
  add_foreign_key "survey_response_users", "surveys"
  add_foreign_key "survey_responses", "survey_questions", column: "survey_questions_id"
  add_foreign_key "survey_responses", "surveys", column: "surveys_id"
end
