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

ActiveRecord::Schema.define(version: 20161215131258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "order"
    t.time    "departure"
    t.time    "arrival"
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id", using: :btree
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id", using: :btree
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_routes_on_name", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.string  "number"
    t.integer "train_id"
    t.integer "start_station_id"
    t.integer "end_station_id"
    t.integer "user_id"
    t.string  "fio"
    t.string  "passport"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id", using: :btree
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id", using: :btree
    t.index ["train_id"], name: "index_tickets_on_train_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "order_from_head",    default: true
    t.index ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
    t.index ["route_id"], name: "index_trains_on_route_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "lastname"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "sit_down_seats"
    t.integer  "train_id"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["id", "type"], name: "index_wagons_on_id_and_type", using: :btree
    t.index ["train_id"], name: "index_wagons_on_train_id", using: :btree
  end

end
