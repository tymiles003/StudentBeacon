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

ActiveRecord::Schema.define(version: 20140801034722) do

  create_table "activity", force: true do |t|
    t.string   "username"
    t.string   "beaconid"
    t.string   "event"
    t.string   "description"
    t.string   "owner"
    t.datetime "event_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "day"
    t.integer  "event_start"
    t.integer  "event_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification", force: true do |t|
    t.string   "username"
    t.string   "message"
    t.string   "beaconid"
    t.datetime "between_start"
    t.datetime "between_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
