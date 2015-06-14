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

ActiveRecord::Schema.define(version: 20150613171650) do

  create_table "comments", force: :cascade do |t|
    t.string   "user_name"
    t.text     "content"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_playerships", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "orgnization"
  end

  create_table "live_rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "provider"
  end

  create_table "match_liveroomships", force: :cascade do |t|
    t.integer  "match_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "live_room_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "time"
    t.integer  "event_id"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.text     "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "matches", ["time"], name: "index_matches_on_time"

  create_table "results", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player1_score"
    t.integer  "player2_score"
    t.text     "description"
    t.string   "videourl"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "roles_mask"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
