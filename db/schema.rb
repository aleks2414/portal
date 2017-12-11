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

ActiveRecord::Schema.define(version: 20171211173444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "nombre"
    t.text     "mensaje"
    t.integer  "rating"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree

  create_table "event_attachments", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_attachments", ["event_id"], name: "index_event_attachments_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "categoria"
    t.string   "video_url"
    t.text     "content"
    t.string   "fecha"
    t.string   "lugar"
    t.boolean  "is_brides"
    t.string   "brides"
    t.boolean  "is_tux"
    t.string   "tux"
    t.boolean  "is_pasteles"
    t.string   "pasteles"
    t.boolean  "is_latingraf"
    t.string   "latingraf"
    t.boolean  "is_detalles"
    t.string   "detalles"
    t.boolean  "is_latino"
    t.string   "latino"
    t.boolean  "is_nissi"
    t.string   "nissi"
    t.boolean  "is_gabriella"
    t.string   "gabriella"
    t.boolean  "is_pixen"
    t.string   "pixen"
    t.boolean  "is_pelo"
    t.string   "pelo"
    t.boolean  "is_joymas"
    t.string   "joymas"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.string   "tags"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "provider_attachments", force: :cascade do |t|
    t.integer  "provider_id"
    t.string   "image2"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "provider_attachments", ["provider_id"], name: "index_provider_attachments_on_provider_id", using: :btree

  create_table "provider_comments", force: :cascade do |t|
    t.string   "nombre"
    t.text     "mensaje"
    t.integer  "servicio"
    t.integer  "atencion"
    t.integer  "calidad"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "provider_comments", ["provider_id"], name: "index_provider_comments_on_provider_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "foto"
    t.string   "productos"
    t.string   "anticipacion"
    t.string   "telefono"
    t.string   "correo"
    t.text     "info_general"
    t.text     "servicios"
    t.text     "domicilio"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.string   "tags"
  end

  add_index "providers", ["slug"], name: "index_providers_on_slug", unique: true, using: :btree
  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "events"
  add_foreign_key "event_attachments", "events"
  add_foreign_key "events", "users"
  add_foreign_key "provider_attachments", "providers"
  add_foreign_key "provider_comments", "providers"
  add_foreign_key "providers", "users"
end
