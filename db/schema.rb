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

ActiveRecord::Schema.define(version: 20140424000101) do

  create_table "color_schemes", force: true do |t|
    t.integer  "color_id",   null: false
    t.string   "color_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "user",                            null: false
    t.integer  "number_of_guesess",   default: 6, null: false
    t.string   "target_guess_number",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guesses", force: true do |t|
    t.string   "first_color",                                 null: false
    t.string   "second_color",                                null: false
    t.string   "third_color",                                 null: false
    t.string   "fourth_color",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "correct_digit",                   default: 0
    t.integer  "correct_digit_at_wrong_position", default: 0
    t.integer  "game_id"
  end

  add_index "guesses", ["game_id"], name: "index_guesses_on_game_id"

end
