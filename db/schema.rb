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

ActiveRecord::Schema.define(version: 20200916042507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "number",                     null: false
    t.integer  "practice_area",  default: 0, null: false
    t.integer  "stage",          default: 0, null: false
    t.string   "description"
    t.integer  "billing_method", default: 0, null: false
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["client_id"], name: "index_cases_on_client_id", using: :btree
    t.index ["user_id"], name: "index_cases_on_user_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "email",             default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "address"
    t.string   "phone_number",      default: "", null: false
    t.string   "ssn"
    t.string   "arn"
    t.string   "emergency_contact", default: "", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           default: "", null: false
    t.string   "encrypted_password",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "name"
    t.integer  "rol",                             default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "authentication_token"
    t.datetime "authentication_token_created_at"
    t.integer  "title",                           default: 0
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
