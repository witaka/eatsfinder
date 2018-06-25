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

ActiveRecord::Schema.define(version: 2018_06_25_004920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "dish_type"
    t.string "description"
    t.string "price"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["provider_id"], name: "index_dishes_on_provider_id"
    t.index ["user_id"], name: "index_dishes_on_user_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "email"
    t.string "phone_number"
    t.string "website"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "food_provider", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "dishes", "providers"
  add_foreign_key "dishes", "users"
  add_foreign_key "providers", "users"
end