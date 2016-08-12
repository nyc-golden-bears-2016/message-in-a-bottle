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

ActiveRecord::Schema.define(version: 20160811201101) do
ActiveRecord::Schema.define(version: 20160811173336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "prompt_id"
    t.boolean  "is_private"
    t.boolean  "is_read"
    t.boolean  "can_respond"
    t.string   "body",        null: false
    t.integer  "user_id",     null: false
    t.integer  "prompt_id"
    t.boolean  "is_private",  null: false
    t.boolean  "is_read",     null: false
    t.boolean  "can_respond", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["prompt_id"], name: "index_entries_on_prompt_id", using: :btree
    t.index ["user_id"], name: "index_entries_on_user_id", using: :btree
  end

  create_table "prompts", force: :cascade do |t|
    t.string   "question"
    t.string   "question",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.string   "body"
    t.integer  "entry_id_id"
    t.boolean  "is_read"
    t.boolean  "can_respond"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["entry_id_id"], name: "index_responses_on_entry_id_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.string   "body",        null: false
    t.integer  "entry_id",    null: false
    t.integer  "user_id",     null: false
    t.boolean  "is_read",     null: false
    t.boolean  "can_respond", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["entry_id"], name: "index_responses_on_entry_id", using: :btree
    t.index ["user_id"], name: "index_responses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
