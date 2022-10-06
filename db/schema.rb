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

ActiveRecord::Schema[7.0].define(version: 2022_10_06_144113) do
  create_table "candies", force: :cascade do |t|
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "variety"
  end

  create_table "fish", force: :cascade do |t|
    t.boolean "fins"
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fish_candies", force: :cascade do |t|
    t.integer "fish_id"
    t.integer "candy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.text "name"
    t.integer "trinket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trinket_id"], name: "index_members_on_trinket_id"
  end

  create_table "tbl1", id: false, force: :cascade do |t|
    t.text "one"
    t.integer "two"
  end

  create_table "trinkets", force: :cascade do |t|
    t.text "name"
    t.integer "fish_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fish_id"], name: "index_trinkets_on_fish_id"
  end

  add_foreign_key "members", "trinkets"
  add_foreign_key "trinkets", "fish"
end
