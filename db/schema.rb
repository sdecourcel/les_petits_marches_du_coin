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

ActiveRecord::Schema.define(version: 20170404155950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "firm_products", force: :cascade do |t|
    t.integer  "firm_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firm_id"], name: "index_firm_products_on_firm_id", using: :btree
    t.index ["product_id"], name: "index_firm_products_on_product_id", using: :btree
  end

  create_table "firms", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "location_id", null: false
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_firms_on_location_id", using: :btree
    t.index ["user_id"], name: "index_firms_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "address",     null: false
    t.text     "unique_name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["owner_id"], name: "index_locations_on_owner_id", using: :btree
  end

  create_table "market_suppliers", force: :cascade do |t|
    t.integer  "market_id",  null: false
    t.integer  "user_id",    null: false
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_market_suppliers_on_market_id", using: :btree
    t.index ["user_id"], name: "index_market_suppliers_on_user_id", using: :btree
  end

  create_table "markets", force: :cascade do |t|
    t.integer  "location_id", null: false
    t.integer  "manager_id",  null: false
    t.integer  "week_day",    null: false
    t.time     "start_time",  null: false
    t.time     "stop_time",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_markets_on_location_id", using: :btree
    t.index ["manager_id"], name: "index_markets_on_manager_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "category_level", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "firm_products", "firms"
  add_foreign_key "firm_products", "products"
  add_foreign_key "firms", "locations"
  add_foreign_key "firms", "users"
  add_foreign_key "locations", "users", column: "owner_id"
  add_foreign_key "market_suppliers", "markets"
  add_foreign_key "market_suppliers", "users"
  add_foreign_key "markets", "locations"
  add_foreign_key "markets", "users", column: "manager_id"
end
