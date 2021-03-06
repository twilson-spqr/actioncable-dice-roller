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

ActiveRecord::Schema.define(version: 20170923163620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dice_sets", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "store_link"
    t.string "d4_url", null: false
    t.string "d6_url", null: false
    t.string "d8_url", null: false
    t.string "d10_url", null: false
    t.string "d100_url", null: false
    t.string "d12_url", null: false
    t.string "d20_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "die_rolls", force: :cascade do |t|
    t.integer "table_id", null: false
    t.integer "dice_count", null: false
    t.integer "die_size", null: false
    t.integer "bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "table_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "game_master", default: false, null: false
    t.index ["table_id"], name: "index_invitations_on_table_id"
    t.index ["user_id", "table_id"], name: "by_table_and_user", unique: true
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "table_id"
    t.bigint "user_id"
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_messages_on_table_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "saved_rolls", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "dice_count", null: false
    t.integer "die_size", null: false
    t.integer "bonus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "fireball", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorite_dice", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "invitations", "tables"
  add_foreign_key "invitations", "users"
  add_foreign_key "messages", "tables"
  add_foreign_key "messages", "users"
end
