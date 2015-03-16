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

ActiveRecord::Schema.define(version: 20150316200919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.string   "title",                                 null: false
    t.string   "category",                              null: false
    t.string   "url"
    t.string   "image_url",                             null: false
    t.boolean  "purchased",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gift_img_file_name"
    t.string   "gift_img_content_type"
    t.integer  "gift_img_file_size"
    t.datetime "gift_img_updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "prompt_id",  null: false
    t.integer  "user_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prompts", force: :cascade do |t|
    t.string   "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.string   "artist",     null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "status",           default: "NoResponse"
    t.string   "username",                                null: false
    t.string   "password_digest",                         null: false
    t.string   "name",                                    null: false
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.boolean  "invited_plus_one", default: false
    t.integer  "number_in_party",  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
