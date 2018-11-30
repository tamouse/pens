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

ActiveRecord::Schema.define(version: 2018_11_30_074420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "label"
    t.boolean "active", default: true, null: false
    t.string "address_1"
    t.string "address_2"
    t.string "address_3"
    t.string "address_4"
    t.string "locality"
    t.string "region_code"
    t.string "country_code"
    t.string "postal_code"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "timezone"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "inkings", force: :cascade do |t|
    t.string "name"
    t.date "ink_date"
    t.text "notes"
    t.bigint "pen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pen_id"], name: "index_inkings_on_pen_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pens", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.string "name"
    t.text "description"
    t.bigint "manufacturer_id"
    t.string "model"
    t.string "color"
    t.string "nib_size"
    t.string "nib_width"
    t.date "purchase_date"
    t.bigint "vendor_id"
    t.boolean "edc", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_pens_on_manufacturer_id"
    t.index ["vendor_id"], name: "index_pens_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", default: "", null: false
    t.string "preferred_name"
    t.string "preferred_pronouns"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true, null: false
    t.text "description"
    t.text "notes"
    t.string "url"
    t.string "phone"
    t.string "fax"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inkings", "pens"
  add_foreign_key "pens", "manufacturers"
  add_foreign_key "pens", "vendors"
end
