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

ActiveRecord::Schema.define(version: 2020_05_09_155819) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.string "issue"
    t.integer "user_id", null: false
    t.integer "technician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technician_id"], name: "index_appointments_on_technician_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "category"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "phone_number"
    t.boolean "management", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

  add_foreign_key "appointments", "technicians"
  add_foreign_key "appointments", "users"
end
