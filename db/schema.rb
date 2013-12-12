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

ActiveRecord::Schema.define(version: 20131211194740) do

  create_table "assets", force: true do |t|
    t.string   "name"
    t.boolean  "received",      default: false
    t.string   "notes"
    t.datetime "expected_date"
    t.datetime "received_date"
    t.integer  "project_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "contact_address"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverables", force: true do |t|
    t.string   "name"
    t.boolean  "complete"
    t.datetime "completed_date"
    t.integer  "user_id"
    t.string   "notes"
    t.integer  "project_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.datetime "estimated_date"
    t.datetime "actual_date"
    t.float    "estimated_time"
    t.float    "actual_time"
    t.string   "notes"
    t.integer  "project_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",       default: false
    t.integer  "position"
    t.string   "phase"
  end

  add_index "milestones", ["client_id"], name: "index_milestones_on_client_id"
  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id"

  create_table "projects", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "project_number"
    t.string   "project_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "total_time_spent"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",         default: false
  end

  add_index "projects", ["project_type"], name: "index_projects_on_project_type"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
