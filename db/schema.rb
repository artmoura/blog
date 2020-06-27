# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_22_160348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "highlight_image"
    t.text "highlight"
    t.integer "status"
    t.string "metadata"
    t.datetime "published_at"
    t.bigint "admin_id"
    t.integer "click_count"
    t.json "tags"
    t.string "searcher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["admin_id"], name: "index_articles_on_admin_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["published_at"], name: "index_articles_on_published_at"
    t.index ["status"], name: "index_articles_on_status"
    t.index ["title"], name: "index_articles_on_title"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "article_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["comment_id"], name: "index_comments_on_comment_id"
  end

  add_foreign_key "articles", "admins"
  add_foreign_key "articles", "categories"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "comments"
end
