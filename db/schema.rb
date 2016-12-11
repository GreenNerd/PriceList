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

ActiveRecord::Schema.define(version: 20161127180057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "auths", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_auths_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_auths_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "stock_keeping_unit_id"
    t.integer  "order_id"
    t.decimal  "unit_price",            precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price",           precision: 12, scale: 3
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["stock_keeping_unit_id"], name: "index_order_items_on_stock_keeping_unit_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "tax",        precision: 12, scale: 3
    t.decimal  "shipping",   precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "products", force: :cascade do |t|
    t.json    "image_url"
    t.json    "thumb"
    t.json    "pictures"
    t.decimal "price",       precision: 12, scale: 3
    t.boolean "active"
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "stock_keeping_units", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "inventory_count"
    t.string   "product_type"
    t.decimal  "prices"
    t.json     "dimensions"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["product_id"], name: "index_stock_keeping_units_on_product_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "stock_keeping_units"
  add_foreign_key "products", "categories"
  add_foreign_key "stock_keeping_units", "products", on_delete: :cascade
end
