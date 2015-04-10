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

ActiveRecord::Schema.define(version: 20150317162320) do

  create_table "episode_relationships", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "episode_id"
  end

  create_table "episodes", force: true do |t|
    t.integer  "episode_number"
    t.string   "name"
    t.date     "air_date"
    t.text     "overview"
    t.string   "still_path"
    t.float    "vote_average"
    t.integer  "vote_count"
    t.integer  "season_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id"

  create_table "season_relationships", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "season_id"
  end

  create_table "seasons", force: true do |t|
    t.integer  "season_number"
    t.string   "name"
    t.date     "air_date"
    t.text     "overview"
    t.string   "poster_path"
    t.integer  "tv_show_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "seasons", ["tv_show_id"], name: "index_seasons_on_tv_show_id"

  create_table "tracked_shows", id: false, force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tv_show_relationships", force: true do |t|
    t.integer  "tv_show_id",                 null: false
    t.integer  "user_id",                    null: false
    t.boolean  "tracked",    default: false
    t.boolean  "watched",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tv_shows", force: true do |t|
    t.string   "name"
    t.string   "created_by"
    t.integer  "no_of_seasons"
    t.integer  "no_of_episodes"
    t.date     "first_air_date"
    t.date     "last_air_date"
    t.text     "overview"
    t.string   "poster_path"
    t.string   "status"
    t.float    "rating"
    t.integer  "votes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "users_tracked_shows_joins", id: false, force: true do |t|
    t.integer "user_id",         null: false
    t.integer "tracked_show_id", null: false
  end

end
