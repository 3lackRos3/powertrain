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

ActiveRecord::Schema.define(version: 20150915121750) do

  create_table "applications", force: :cascade do |t|
    t.string   "make",       limit: 255
    t.string   "model",      limit: 255
    t.string   "year",       limit: 255
    t.string   "cyl",        limit: 255
    t.string   "size",       limit: 255
    t.string   "drv",        limit: 255
    t.string   "vin",        limit: 255
    t.string   "options",    limit: 255
    t.integer  "engine_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "subtitle",     limit: 255
    t.string   "price",        limit: 255
    t.string   "stock_status", limit: 255
    t.string   "coreamount",   limit: 255
    t.string   "availability", limit: 255
    t.string   "product_code", limit: 255
    t.text     "image_urls",   limit: 65535
    t.text     "description",  limit: 65535
    t.integer  "run_id",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "runs", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
