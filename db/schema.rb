# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_27_180752) do
  create_table "gym_machines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "gym_id", null: false
    t.bigint "machine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_gym_machines_on_gym_id"
    t.index ["machine_id"], name: "index_gym_machines_on_machine_id"
  end

  create_table "gyms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "location"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machine_menus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "machine_id", null: false
    t.bigint "menu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_machine_menus_on_machine_id"
    t.index ["menu_id"], name: "index_machine_menus_on_menu_id"
  end

  create_table "machines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label"
    t.integer "machineid"
    t.index ["machineid"], name: "index_machines_on_machineid"
  end

  create_table "menus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "machine_id", null: false
    t.string "part"
    t.integer "count"
    t.integer "set_count"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "weight"
    t.index ["machine_id"], name: "index_menus_on_machine_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "height"
    t.float "weight"
  end

  create_table "users_trainings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "menu_id", null: false
    t.datetime "training_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reps"
    t.float "weight"
    t.integer "set_count"
    t.string "memo"
    t.index ["menu_id"], name: "index_users_trainings_on_menu_id"
    t.index ["user_id"], name: "index_users_trainings_on_user_id"
  end

  add_foreign_key "gym_machines", "gyms"
  add_foreign_key "gym_machines", "machines"
  add_foreign_key "machine_menus", "machines"
  add_foreign_key "machine_menus", "menus"
  add_foreign_key "menus", "machines"
  add_foreign_key "users_trainings", "menus"
  add_foreign_key "users_trainings", "users"
end
