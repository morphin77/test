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

ActiveRecord::Schema.define(version: 2020_01_21_234153) do

  create_table "action_permissions", force: :cascade do |t|
    t.string "name"
    t.integer "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_action_permissions_on_action_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_permissions", force: :cascade do |t|
    t.string "name"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_resource_permissions_on_resource_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_action_privileges", force: :cascade do |t|
    t.integer "user_id"
    t.integer "action_id"
    t.integer "action_permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_user_action_privileges_on_action_id"
    t.index ["action_permission_id"], name: "index_user_action_privileges_on_action_permission_id"
    t.index ["user_id"], name: "index_user_action_privileges_on_user_id"
  end

  create_table "user_resource_privileges", force: :cascade do |t|
    t.integer "user_id"
    t.integer "resource_id"
    t.integer "resource_permission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_user_resource_privileges_on_resource_id"
    t.index ["resource_permission_id"], name: "index_user_resource_privileges_on_resource_permission_id"
    t.index ["user_id"], name: "index_user_resource_privileges_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
