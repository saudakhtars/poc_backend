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

ActiveRecord::Schema.define(version: 20171207094755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ideas", force: :cascade do |t|
    t.string   "photo"
    t.string   "name"
    t.string   "banner"
    t.string   "title"
    t.text     "description"
    t.integer  "likescount"
    t.integer  "commentscount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spam_details", force: :cascade do |t|
    t.integer "spam_number", limit: 8
    t.integer "spam_by",     limit: 8
  end

  create_table "spams", force: :cascade do |t|
    t.integer "phone_number", limit: 8
    t.integer "count",                  default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
