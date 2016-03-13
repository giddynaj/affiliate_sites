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

ActiveRecord::Schema.define(version: 20160313223321) do

  create_table "client_versions", force: :cascade do |t|
    t.integer  "client_id",   limit: 4
    t.datetime "updated_at",              null: false
    t.datetime "created_at",              null: false
    t.string   "description", limit: 255
  end

  add_index "client_versions", ["client_id"], name: "index_client_versions_on_client_id", using: :btree
  add_index "client_versions", ["description"], name: "index_description", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "base_url",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "visitor_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "form_field_groups", force: :cascade do |t|
    t.string "description", limit: 45
  end

  create_table "form_field_memberships", id: false, force: :cascade do |t|
    t.integer "form_field_group_id", limit: 4, null: false
    t.integer "form_field_id",       limit: 4
    t.integer "order",               limit: 4
  end

  create_table "form_fields", force: :cascade do |t|
    t.string  "description",      limit: 45
    t.string  "html_type",        limit: 45
    t.string  "name",             limit: 45
    t.string  "label",            limit: 45
    t.string  "placeholder",      limit: 45
    t.string  "default_value",    limit: 45
    t.integer "options_group_id", limit: 4
  end

  create_table "options_groups", force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.string  "value",    limit: 155
  end

  create_table "stages", force: :cascade do |t|
    t.string  "name",                limit: 255
    t.integer "client_id",           limit: 4
    t.integer "client_version_id",   limit: 4
    t.string  "layout_name",         limit: 255
    t.integer "sequence",            limit: 4
    t.integer "form_field_group_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitors", force: :cascade do |t|
    t.string   "uri",               limit: 255
    t.string   "ip",                limit: 255
    t.string   "user_agent",        limit: 255
    t.string   "referer",           limit: 255
    t.datetime "created_at",                    null: false
    t.integer  "context_id",        limit: 4
    t.string   "client",            limit: 255
    t.integer  "client_version_id", limit: 4
    t.integer  "client_id",         limit: 4
    t.datetime "updated_at",                    null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "visitor_id",  limit: 4
    t.integer  "stage_id",    limit: 4
    t.datetime "datetime_ts"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "client_versions", "clients"
end
