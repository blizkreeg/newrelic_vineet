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

ActiveRecord::Schema.define(version: 20160805010650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "ts",         null: false
    t.string   "name",       null: false
    t.string   "hostname",   null: false
    t.integer  "org_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["hostname"], name: "index_events_on_hostname", using: :btree
  add_index "events", ["org_id"], name: "index_events_on_org_id", using: :btree
  add_index "events", ["ts"], name: "index_events_on_ts", using: :btree

  create_table "orgs", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "domain",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orgs", ["domain"], name: "index_orgs_on_domain", using: :btree
  add_index "orgs", ["name"], name: "index_orgs_on_name", using: :btree

  add_foreign_key "events", "orgs"
end
