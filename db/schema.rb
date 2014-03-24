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

ActiveRecord::Schema.define(version: 20140324143620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: true do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "tutorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "code_snippets", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.integer  "order_number"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "sub_chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["sub_chapter_id"], name: "index_contents_on_sub_chapter_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "image_path_file_name"
    t.string   "image_path_content_type"
    t.integer  "image_path_file_size"
    t.datetime "image_path_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paragraphs", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_chapters", force: true do |t|
    t.string   "title"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number",     default: 0
  end

  add_index "sub_chapters", ["chapter_id"], name: "index_sub_chapters_on_chapter_id", using: :btree

  create_table "subtopics", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subtopics", ["topic_id"], name: "index_subtopics_on_topic_id", using: :btree

  create_table "topics", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tutorials", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "subtopic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "community_id"
  end

  add_index "tutorials", ["subtopic_id"], name: "index_tutorials_on_subtopic_id", using: :btree
  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "user_name"
    t.integer  "karma",                  default: 0,  null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
