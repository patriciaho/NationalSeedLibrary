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

ActiveRecord::Schema.define(version: 20140305071116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: true do |t|
    t.integer  "library_id"
    t.integer  "seed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["library_id"], name: "index_collections_on_library_id", using: :btree
  add_index "collections", ["seed_id"], name: "index_collections_on_seed_id", using: :btree

  create_table "libraries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "seeds", force: true do |t|
    t.string   "common_name"
    t.string   "scientific_name"
    t.string   "planting_season"
    t.text     "description"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "harvest_photo_file_name"
    t.string   "harvest_photo_content_type"
    t.integer  "harvest_photo_file_size"
    t.datetime "harvest_photo_updated_at"
    t.string   "plant_photo_file_name"
    t.string   "plant_photo_content_type"
    t.integer  "plant_photo_file_size"
    t.datetime "plant_photo_updated_at"
    t.string   "seed_photo_file_name"
    t.string   "seed_photo_content_type"
    t.integer  "seed_photo_file_size"
    t.datetime "seed_photo_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "salt"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
