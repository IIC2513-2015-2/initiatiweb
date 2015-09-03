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

ActiveRecord::Schema.define(version: 20150901125012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "initiatives", force: :cascade do |t|
    t.string   "title",                       null: false
    t.text     "description",                 null: false
    t.string   "image"
    t.boolean  "active",      default: false
    t.string   "hashtag"
    t.integer  "ngo_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "initiatives", ["ngo_id"], name: "index_initiatives_on_ngo_id", using: :btree

  create_table "ngos", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "logo"
    t.string   "email"
    t.text     "description"
    t.string   "webpage"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ngos", ["name"], name: "index_ngos_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                null: false
    t.string   "last_name",                 null: false
    t.string   "email",                     null: false
    t.string   "password",                  null: false
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "initiatives", "ngos"
end
