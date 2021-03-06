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

ActiveRecord::Schema.define(version: 20150329012710) do

  create_table "admins", force: :cascade do |t|
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
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "content_modules", force: :cascade do |t|
    t.string   "title",       limit: 255,               null: false
    t.text     "description", limit: 65535,             null: false
    t.integer  "order",       limit: 4,     default: 1
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "project_id",  limit: 4,                 null: false
  end

  add_index "content_modules", ["project_id"], name: "index_content_modules_on_project_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.integer  "order",              limit: 4,   default: 1
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "content_module_id",  limit: 4,               null: false
  end

  add_index "photos", ["content_module_id"], name: "index_photos_on_content_module_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "company",                    limit: 255,               null: false
    t.text     "brief_description",          limit: 65535,             null: false
    t.string   "website_type",               limit: 255,               null: false
    t.string   "role",                       limit: 255,               null: false
    t.text     "challenge",                  limit: 65535,             null: false
    t.string   "website",                    limit: 255
    t.integer  "order",                      limit: 4,     default: 1
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "company_image_file_name",    limit: 255
    t.string   "company_image_content_type", limit: 255
    t.integer  "company_image_file_size",    limit: 4
    t.datetime "company_image_updated_at"
  end

  create_table "site_properties", force: :cascade do |t|
    t.string   "key",        limit: 255,   null: false
    t.text     "value",      limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "site_properties", ["key"], name: "index_site_properties_on_key", unique: true, using: :btree

end
