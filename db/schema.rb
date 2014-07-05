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

ActiveRecord::Schema.define(version: 20140620192942) do

  create_table "brands", force: true do |t|
    t.string  "name",       limit: 100, null: false
    t.integer "brewery_id",             null: false
  end

  add_index "brands", ["brewery_id"], name: "index_brands_on_brewery_id"
  add_index "brands", ["name", "brewery_id"], name: "index_brands_on_name_and_brewery_id", unique: true

  create_table "breweries", force: true do |t|
    t.string "name", limit: 100, null: false
  end

  add_index "breweries", ["name"], name: "index_breweries_on_name", unique: true

  create_table "group_memberships", force: true do |t|
    t.integer "member_id",              null: false
    t.string  "member_type",            null: false
    t.integer "group_id",               null: false
    t.string  "label",       limit: 40
  end

  add_index "group_memberships", ["member_id", "member_type"], name: "index_group_memberships_on_member_id_and_member_type"

  create_table "groups", force: true do |t|
    t.string "name", limit: 40, null: false
  end

  create_table "packagings", force: true do |t|
    t.string  "material",      limit: 20, null: false
    t.string  "name",          limit: 30
    t.integer "quantity",                 null: false
    t.integer "volume_scalar",            null: false
    t.string  "volume_units",  limit: 20, null: false
  end

  add_index "packagings", ["material", "quantity", "volume_scalar", "volume_units"], name: "unique_material_quantity_volume", unique: true

  create_table "price_data", force: true do |t|
    t.integer  "brand_id",                       null: false
    t.date     "date",                           null: false
    t.integer  "retailer_id",                    null: false
    t.boolean  "on_special",     default: false, null: false
    t.integer  "packaging_id",                   null: false
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "price_data", ["brand_id"], name: "index_price_data_on_brand_id"
  add_index "price_data", ["packaging_id"], name: "index_price_data_on_packaging_id"
  add_index "price_data", ["retailer_id"], name: "index_price_data_on_retailer_id"

  create_table "retailers", force: true do |t|
    t.string  "name",     limit: 100, null: false
    t.integer "route_id"
  end

  add_index "retailers", ["route_id"], name: "index_retailers_on_route_id"

  create_table "routes", force: true do |t|
    t.string "name", limit: 50, null: false
  end

end
