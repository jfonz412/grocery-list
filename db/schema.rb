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

ActiveRecord::Schema.define(version: 20170921184002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_categories_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "user_id"
    t.integer  "list_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["list_id"], name: "index_items_on_list_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "list_items", force: :cascade do |t|
    t.integer  "list_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_item_id"
    t.integer  "quantity",     default: 1
    t.index ["list_id"], name: "index_list_items_on_list_id", using: :btree
    t.index ["user_item_id"], name: "index_list_items_on_user_item_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "user_items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "included",    default: true
    t.index ["category_id"], name: "index_user_items_on_category_id", using: :btree
    t.index ["user_id"], name: "index_user_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "lists"
  add_foreign_key "items", "users"
  add_foreign_key "list_items", "lists"
  add_foreign_key "list_items", "user_items"
  add_foreign_key "lists", "users"
  add_foreign_key "user_items", "categories"
  add_foreign_key "user_items", "users"
end
