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

ActiveRecord::Schema.define(version: 2019_06_29_054529) do

  create_table "actions", force: :cascade do |t|
    t.string "controller_name"
    t.string "action_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name"], name: "index_actions_on_controller_name_and_action_name", unique: true
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "publish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log", limit: 1073741823
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "blog_post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_post_comments_on_blog_post_id"
    t.index ["user_id"], name: "index_post_comments_on_user_id"
  end

  create_table "role_rights", force: :cascade do |t|
    t.integer "role_id"
    t.integer "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_role_rights_on_action_id"
    t.index ["role_id", "action_id"], name: "index_role_rights_on_role_id_and_action_id", unique: true
    t.index ["role_id"], name: "index_role_rights_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_roles_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscription_type"
    t.integer "role_id"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
