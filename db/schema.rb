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

ActiveRecord::Schema.define(version: 20131120124359) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "zip_code"
    t.string   "city"
    t.string   "nip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_items", force: true do |t|
    t.decimal  "price",      precision: 10, scale: 0
    t.string   "name"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree

  create_table "invoice_notes", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_notes", ["invoice_id"], name: "index_invoice_notes_on_invoice_id", using: :btree
  add_index "invoice_notes", ["user_id"], name: "index_invoice_notes_on_user_id", using: :btree

  create_table "invoices", force: true do |t|
    t.date     "purchase_date"
    t.date     "issue_date"
    t.string   "payment_period"
    t.string   "invoice_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "zip_code"
    t.string   "city"
    t.string   "nip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
