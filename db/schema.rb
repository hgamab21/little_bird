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

ActiveRecord::Schema.define(version: 20160306155114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followings", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.boolean "blocked",     default: false
  end

  add_index "followings", ["followed_id"], name: "index_followings_on_followed_id", using: :btree
  add_index "followings", ["follower_id"], name: "index_followings_on_follower_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "liked_id"
    t.integer  "liker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts_users", ["post_id"], name: "index_posts_users_on_post_id", using: :btree
  add_index "posts_users", ["user_id"], name: "index_posts_users_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_posts", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags_posts", ["post_id"], name: "index_tags_posts_on_post_id", using: :btree
  add_index "tags_posts", ["tag_id"], name: "index_tags_posts_on_tag_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
    t.integer  "updated_by"
  end

end
