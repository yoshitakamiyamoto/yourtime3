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

ActiveRecord::Schema.define(version: 20171026023515) do

  create_table "activities", force: :cascade do |t|
    t.string  "value",   limit: 255
    t.integer "user_id", limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.string  "value",     limit: 255
    t.integer "report_id", limit: 4
    t.text    "created",   limit: 65535
    t.text    "modified",  limit: 65535
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "available_time", limit: 4
    t.integer  "used_time",      limit: 4
    t.text     "comment",        limit: 65535
    t.integer  "activity_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "activity_id", limit: 4
  end

  create_table "user_follows", force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "followed_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.text     "profile_image",          limit: 65535
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "activity_id",            limit: 4
    t.string   "goal",                   limit: 255
    t.string   "position",               limit: 255
    t.text     "s_introducution",        limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
