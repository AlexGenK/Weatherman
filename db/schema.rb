# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_29_093734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimensions", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "category"
    t.float "guideline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.string "influx_id"
    t.float "calibration"
    t.float "coefficient"
    t.integer "rank"
    t.bigint "station_id", null: false
    t.bigint "dimension_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dimension_id"], name: "index_measurements_on_dimension_id"
    t.index ["station_id"], name: "index_measurements_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "influx_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "measurements", "dimensions"
  add_foreign_key "measurements", "stations"
end
