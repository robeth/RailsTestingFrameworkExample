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

ActiveRecord::Schema.define(version: 20160617043651) do

  create_table "orders", force: :cascade do |t|
    t.string   "order_id"
    t.string   "item1"
    t.string   "item2"
    t.string   "vtweblink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["order_id"], name: "index_orders_on_order_id", unique: true

  create_table "pays", force: :cascade do |t|
    t.string   "order_id"
    t.string   "payment_type"
    t.string   "transaction_status"
    t.string   "fraud_status"
    t.integer  "gross_amount"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "pays", ["order_id"], name: "index_pays_on_order_id", unique: true

end
