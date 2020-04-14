# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_14_062815) do

  create_table "bikers", force: :cascade do |t|
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.string "home_city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bikes", force: :cascade do |t|
    t.integer "biker_id", null: false
    t.integer "manufacturer_id", null: false
    t.string "bike_name"
    t.string "bike_type"
    t.boolean "stolen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["biker_id"], name: "index_bikes_on_biker_id"
    t.index ["manufacturer_id"], name: "index_bikes_on_manufacturer_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_comments", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "biker_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["biker_id"], name: "index_trip_comments_on_biker_id"
    t.index ["trip_id"], name: "index_trip_comments_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "biker_id", null: false
    t.integer "bike_id", null: false
    t.string "name"
    t.string "start_city"
    t.string "dest_city"
    t.string "distance_miles"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bike_id"], name: "index_trips_on_bike_id"
    t.index ["biker_id"], name: "index_trips_on_biker_id"
  end

  add_foreign_key "bikes", "bikers"
  add_foreign_key "bikes", "manufacturers"
  add_foreign_key "trip_comments", "bikers"
  add_foreign_key "trip_comments", "trips"
  add_foreign_key "trips", "bikers"
  add_foreign_key "trips", "bikes"
end
