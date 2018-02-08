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

ActiveRecord::Schema.define(version: 20180206164113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_tokens", ["name"], name: "index_api_tokens_on_name", unique: true, using: :btree
  add_index "api_tokens", ["token"], name: "index_api_tokens_on_token", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "health_checks", force: :cascade do |t|
    t.datetime "time_of_last_check", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "job_notifications", force: :cascade do |t|
    t.integer "job_id"
    t.integer "notification_id"
    t.string  "last_event_key"
  end

  add_index "job_notifications", ["job_id", "notification_id"], name: "index_job_notifications_on_job_id_and_notification_id", unique: true, using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.datetime "last_successful_time"
    t.datetime "next_scheduled_time",                    null: false
    t.string   "public_id",                              null: false
    t.string   "type",                                   null: false
    t.integer  "frequency"
    t.string   "cron_expression"
    t.integer  "buffer_time"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "status",               default: "READY", null: false
  end

  add_index "jobs", ["next_scheduled_time"], name: "index_jobs_on_next_scheduled_time", using: :btree
  add_index "jobs", ["public_id"], name: "index_jobs_on_public_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "type",       null: false
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notifications", ["type"], name: "index_notifications_on_type", using: :btree

end
