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

ActiveRecord::Schema.define(version: 20131104193702) do

  create_table "assets", force: true do |t|
    t.string   "name"
    t.boolean  "received"
    t.string   "notes"
    t.datetime "expected_date"
    t.datetime "received_date"
    t.integer  "milestone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
  end

  create_table "checkpoints", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "estimate"
    t.integer  "user_id"
    t.integer  "milestone_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",     default: false
    t.integer  "project_id"
  end

  add_index "checkpoints", ["project_id"], name: "index_checkpoints_on_project_id"

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "estimate"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",       default: false
    t.string   "milestone_type"
  end

  add_index "milestones", ["milestone_type"], name: "index_milestones_on_milestone_type"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.string   "team"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
