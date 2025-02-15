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

ActiveRecord::Schema[7.0].define(version: 2025_01_22_182108) do
  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "tracker_subscriptions", force: :cascade do |t|
    t.integer "tracking_number_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracking_events", force: :cascade do |t|
    t.string "tracking_number_id"
    t.text "event"
    t.datetime "happened_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracking_numbers", force: :cascade do |t|
    t.string "tag"
    t.integer "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "index_tracking_numbers_on_tag"
  end

end
