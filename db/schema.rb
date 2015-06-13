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

ActiveRecord::Schema.define(version: 20150612210418) do

  create_table "big_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cloths", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.integer  "small_category_id"
    t.string   "color1"
    t.string   "color2"
    t.string   "design"
    t.string   "qr"
    t.integer  "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "cloths", ["small_category_id"], name: "index_cloths_on_small_category_id"

  create_table "small_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "big_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "small_categories", ["big_category_id"], name: "index_small_categories_on_big_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_cloths", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cloth_id"
    t.boolean  "buy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_cloths", ["cloth_id"], name: "index_users_cloths_on_cloth_id"
  add_index "users_cloths", ["user_id"], name: "index_users_cloths_on_user_id"

end
