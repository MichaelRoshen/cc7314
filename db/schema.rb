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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160602073002) do

  create_table "building_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.integer  "num"
    t.string   "name"
    t.string   "face"
    t.integer  "cell_gate_num"
    t.integer  "floor_num"
    t.integer  "door_num"
    t.integer  "building_type_id"
    t.integer  "estate_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "charge_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.string   "name"
    t.integer  "charge_type_id"
    t.float    "price"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.text     "content"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estates", force: :cascade do |t|
    t.string   "name"
    t.float    "area"
    t.string   "position"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.float    "price"
    t.float    "total_price"
    t.date     "date"
    t.integer  "product_type_id"
    t.string   "note"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.string   "phone"
    t.string   "address"
    t.date     "send_date"
    t.date     "repair_date"
    t.string   "repairman"
    t.text     "summary"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "price"
    t.float    "bonus"
    t.date     "grant_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "id_card"
    t.integer  "age"
    t.string   "phone"
    t.string   "role"
    t.string   "email"
    t.string   "login"
    t.integer  "cell_gate"
    t.integer  "floor"
    t.integer  "house_num"
    t.date     "room_in_date"
    t.integer  "room_type_id"
    t.integer  "building_id"
    t.float    "area"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
