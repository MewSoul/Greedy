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

ActiveRecord::Schema.define(version: 20131015082408) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mises", force: true do |t|
    t.integer  "amount"
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "user_id"
    t.boolean  "victory"
    t.integer  "gain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "id_race"
    t.integer  "id_team"
    t.string   "name"
    t.text     "description"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo_path"
    t.string   "game"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "rounds", force: true do |t|
    t.integer  "tournament_id"
    t.integer  "id_player_1"
    t.integer  "id_player_2"
    t.integer  "match"
    t.integer  "score_1"
    t.integer  "score_2"
    t.integer  "bet_id_1"
    t.integer  "bet_id_2"
    t.integer  "highlighted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_bet"
    t.boolean  "bet_distributed"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.date     "tournament_start"
    t.date     "tournament_end"
    t.text     "description"
    t.string   "location"
    t.integer  "nb_players"
    t.integer  "cash"
    t.text     "game"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tournament_type"
    t.text     "url_chat"
    t.text     "url_stream"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits"
    t.integer  "earnings"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
