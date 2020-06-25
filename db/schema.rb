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

ActiveRecord::Schema.define(version: 2020_06_25_093257) do

  create_table "kanban_tag_relations", force: :cascade do |t|
    t.integer "kanban_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kanban_id"], name: "index_kanban_tag_relations_on_kanban_id"
    t.index ["tag_id"], name: "index_kanban_tag_relations_on_tag_id"
  end

  create_table "kanbans", force: :cascade do |t|
    t.text "content"
    t.integer "stage"
    t.datetime "deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lane_kanban_relations", force: :cascade do |t|
    t.integer "lane_id", null: false
    t.integer "kanban_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kanban_id"], name: "index_lane_kanban_relations_on_kanban_id"
    t.index ["lane_id"], name: "index_lane_kanban_relations_on_lane_id"
  end

  create_table "lanes", force: :cascade do |t|
    t.integer "stage", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "kanban_tag_relations", "kanbans"
  add_foreign_key "kanban_tag_relations", "tags"
  add_foreign_key "lane_kanban_relations", "kanbans"
  add_foreign_key "lane_kanban_relations", "lanes"
end
