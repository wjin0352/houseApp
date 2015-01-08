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

ActiveRecord::Schema.define(version: 20150108211153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "readings", primary_key: "reading_id", force: true do |t|
    t.integer  "user_id"
    t.integer  "thermometer_id"
    t.integer  "temperature"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thermometers", primary_key: "thermometer_id", force: true do |t|
    t.string  "name",        limit: 80
    t.string  "email",       limit: 320
    t.string  "location",    limit: 80
    t.integer "temperature"
    t.integer "user_id"
    t.integer "reading_id"
  end

  create_table "users", primary_key: "user_id", force: true do |t|
    t.string   "name",                   limit: 80
    t.integer  "thermometer_id"
    t.integer  "reading_id"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "readings", "thermometers", primary_key: "thermometer_id", name: "readings_thermometer_id_fkey"
  add_foreign_key "readings", "users", primary_key: "user_id", name: "readings_user_id_fkey"
  add_foreign_key "thermometers", "readings", primary_key: "reading_id", name: "thermometers_reading_id_fkey"
  add_foreign_key "thermometers", "users", primary_key: "user_id", name: "thermometers_user_id_fkey"
  add_foreign_key "users", "readings", primary_key: "reading_id", name: "users_reading_id_fkey"
  add_foreign_key "users", "thermometers", primary_key: "thermometer_id", name: "users_thermometer_id_fkey"
end
