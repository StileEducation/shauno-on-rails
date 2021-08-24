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

ActiveRecord::Schema.define(version: 2021_08_24_005737) do

  create_table "button_developers", force: :cascade do |t|
    t.integer "button_id", null: false
    t.integer "developer_id", null: false
    t.boolean "current", default: true
    t.index ["button_id"], name: "index_button_developers_on_button_id"
    t.index ["developer_id"], name: "index_button_developers_on_developer_id"
  end

  create_table "button_reasons", force: :cascade do |t|
    t.integer "button_id", null: false
    t.integer "reason_id", null: false
    t.boolean "current", default: true
    t.index ["button_id"], name: "index_button_reasons_on_button_id"
    t.index ["reason_id"], name: "index_button_reasons_on_reason_id"
  end

  create_table "buttons", force: :cascade do |t|
    t.string "uuid"
    t.boolean "is_active", default: true
  end

  create_table "developers", force: :cascade do |t|
    t.string "name"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "reason"
  end

  add_foreign_key "button_developers", "buttons"
  add_foreign_key "button_developers", "developers"
  add_foreign_key "button_reasons", "buttons"
  add_foreign_key "button_reasons", "reasons"
end
