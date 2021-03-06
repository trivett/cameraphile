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

ActiveRecord::Schema.define(version: 20140515105504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cameras", force: true do |t|
    t.string "brand"
    t.string "model"
    t.string "name"
    t.string "type"
    t.string "megapixels"
    t.string "memory_type"
    t.string "small_image_url"
    t.string "large_image_url"
    t.string "lcd_screen_size"
    t.string "price"
    t.string "asin"
  end

  create_table "cameras_wishlists", force: true do |t|
    t.integer "wishlist_id"
    t.integer "camera_id"
  end

  create_table "photos", force: true do |t|
    t.string "camera_id"
    t.string "flickr_id"
    t.string "photo_url"
    t.string "title"
    t.string "owner"
    t.string "photopage"
    t.string "camera_model"
    t.string "focal_length"
    t.string "lens"
    t.string "exposure_time"
    t.string "aperture"
    t.string "iso_speed"
    t.string "category"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wishlists", force: true do |t|
    t.integer "user_id"
    t.integer "camera_id"
  end

end
