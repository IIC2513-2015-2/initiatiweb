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

ActiveRecord::Schema.define(version: 20151124002716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "initiative_signs", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id",       null: false
    t.integer  "initiative_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "initiative_signs", ["initiative_id"], name: "index_initiative_signs_on_initiative_id", using: :btree
  add_index "initiative_signs", ["user_id", "initiative_id"], name: "index_initiative_signs_on_user_id_and_initiative_id", unique: true, using: :btree
  add_index "initiative_signs", ["user_id"], name: "index_initiative_signs_on_user_id", using: :btree

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
    t.string   "name",               null: false
    t.string   "logo"
    t.string   "email"
    t.text     "description"
    t.string   "webpage"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "open_data_category"
  end

  add_index "ngos", ["name"], name: "index_ngos_on_name", using: :btree

  create_table "ngos_users", id: false, force: :cascade do |t|
    t.integer "ngo_id"
    t.integer "user_id"
  end

  add_index "ngos_users", ["ngo_id", "user_id"], name: "index_ngos_users_on_ngo_id_and_user_id", unique: true, using: :btree
  add_index "ngos_users", ["ngo_id"], name: "index_ngos_users_on_ngo_id", using: :btree
  add_index "ngos_users", ["user_id"], name: "index_ngos_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "email",                           null: false
    t.boolean  "active",           default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "validation_token"
    t.string   "api_key"
  end

  add_index "users", ["api_key"], name: "index_users_on_api_key", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["validation_token"], name: "index_users_on_validation_token", unique: true, using: :btree

  add_foreign_key "initiative_signs", "initiatives"
  add_foreign_key "initiative_signs", "users"
  add_foreign_key "initiatives", "ngos"
  add_foreign_key "ngos_users", "ngos"
  add_foreign_key "ngos_users", "users"
end
