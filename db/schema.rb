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

ActiveRecord::Schema.define(version: 20180222211242) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "father_name"
    t.string "phone"
    t.string "email"
    t.date "date_of_birth"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "pin_zip"
    t.string "country"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_customers_on_client_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "lawsuit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_documents_on_lawsuit_id"
  end

  create_table "fees", force: :cascade do |t|
    t.string "details"
    t.decimal "amount"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_fees_on_client_id"
  end

  create_table "lawsuits", force: :cascade do |t|
    t.string "case_number"
    t.string "case_type"
    t.string "court_name"
    t.string "location"
    t.date "filing_date"
    t.integer "client_id"
    t.string "opposite_party"
    t.text "case_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_lawsuits_on_client_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "detail"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "updates", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.integer "lawsuit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawsuit_id"], name: "index_updates_on_lawsuit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "father_name"
    t.string "job_title"
    t.date "date_of_birth"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "pin_zip"
    t.string "state"
    t.string "country"
    t.text "notes"
    t.boolean "enabled", default: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
