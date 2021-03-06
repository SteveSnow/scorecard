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

ActiveRecord::Schema.define(version: 20160421183151) do

  create_table "holes", force: :cascade do |t|
    t.string   "name"
    t.integer  "yardage_id"
    t.integer  "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
    t.integer  "match_id"
  end

  create_table "match_invites", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "invite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.boolean  "private"
    t.integer  "scorer_id"
    t.string   "track"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "current_hole"
  end

  create_table "member_matches", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
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
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "rounds", force: :cascade do |t|
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "track"
    t.string   "tee"
    t.integer  "match_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "strokes"
    t.integer  "hole_id"
    t.datetime "date"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "gir"
    t.boolean  "fairway"
    t.integer  "putts"
    t.integer  "round_id"
  end

  create_table "yardages", force: :cascade do |t|
    t.integer  "black"
    t.integer  "blue"
    t.integer  "white"
    t.integer  "red"
    t.integer  "gold"
    t.integer  "hole_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
