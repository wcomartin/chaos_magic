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

ActiveRecord::Schema[8.0].define(version: 2025_07_24_075210) do
  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.string "card_type"
    t.text "oracle_text"
    t.text "flavor_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "global_effects", default: []
    t.string "status"
    t.datetime "archived_at"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["person_id"], name: "index_players_on_person_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "damage_roll"
    t.integer "chaos_roll"
    t.index ["card_id"], name: "index_turns_on_card_id"
    t.index ["game_id"], name: "index_turns_on_game_id"
  end

  add_foreign_key "players", "games"
  add_foreign_key "players", "people"
  add_foreign_key "turns", "cards"
  add_foreign_key "turns", "games"
end
