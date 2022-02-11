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

ActiveRecord::Schema.define(version: 2022_02_09_183950) do

  create_table "applications", charset: "utf8mb4", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.integer "chats_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chats", charset: "utf8mb4", force: :cascade do |t|
    t.integer "number"
    t.integer "messages_count", default: 0
    t.bigint "application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id", "number"], name: "index_chats_on_application_id_and_number", unique: true
    t.index ["application_id"], name: "index_chats_on_application_id"
  end

  create_table "messages", charset: "utf8mb4", force: :cascade do |t|
    t.integer "number"
    t.text "content"
    t.bigint "chat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id", "number"], name: "index_messages_on_chat_id_and_number", unique: true
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  add_foreign_key "chats", "applications"
  add_foreign_key "messages", "chats"
end
