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

ActiveRecord::Schema[7.0].define(version: 2024_01_17_201037) do
  create_table "properties", force: :cascade do |t|
    t.string "business_type"
    t.integer "value"
    t.integer "iptu"
    t.integer "condominium"
    t.integer "size"
    t.integer "rooms"
    t.string "zone"
    t.string "address"
    t.string "number"
    t.string "neighborhood"
    t.string "complement"
    t.string "cep"
    t.integer "full_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "pictures", default: []
    t.text "description"
    t.integer "bathrooms", default: 0
    t.integer "car_spaces", default: 0
    t.integer "floors", default: 1
    t.boolean "furnished", default: false
    t.boolean "subway_close", default: false
    t.boolean "pet_friendly", default: false
    t.boolean "active", default: true
  end
end
