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

ActiveRecord::Schema.define(version: 2019_05_18_021604) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "describable_facets", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "describable_type", null: false
    t.integer "describable_id", null: false
    t.bigint "facet_id", null: false
    t.datetime "created_at", null: false
    t.index ["describable_id"], name: "index_describable_facets_on_describable_id"
    t.index ["describable_type", "describable_id", "facet_id"], name: "index_describable_facets_on_describable_facet", unique: true
    t.index ["describable_type", "describable_id"], name: "index_describable_facets_on_describable"
    t.index ["describable_type"], name: "index_describable_facets_on_describable_type"
    t.index ["facet_id"], name: "index_describable_facets_on_facet_id"
  end

  create_table "facets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.index ["value"], name: "index_facets_on_value"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
