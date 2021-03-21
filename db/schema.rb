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

ActiveRecord::Schema.define(version: 2021_03_21_020500) do

  create_table "flags", force: :cascade do |t|
    t.string "nationality"
    t.boolean "approved", default: false
    t.string "wikipedia_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flags_languages", id: false, force: :cascade do |t|
    t.integer "flag_id", null: false
    t.integer "language_id", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "language_users", force: :cascade do |t|
    t.integer "language_id"
    t.integer "user_id"
    t.boolean "foreign_language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "wikipedia_link"
    t.boolean "approved", default: false
    t.boolean "pitched"
    t.boolean "gendered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "skype_username"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
