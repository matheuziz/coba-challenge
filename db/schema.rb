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

ActiveRecord::Schema[7.0].define(version: 2022_04_25_224706) do
  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "segment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.integer "shipment_id"
    t.integer "quantity", default: 1, null: false
    t.decimal "discount", precision: 3, scale: 2, null: false
    t.bigint "profit_cents", null: false
    t.bigint "sales_cents", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_line_items_on_customer_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
    t.index ["shipment_id"], name: "index_line_items_on_shipment_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "external_id", null: false
    t.date "placement_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_orders_on_external_id", unique: true
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_subcategories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "container"
    t.decimal "base_margin"
    t.integer "product_category_id", null: false
    t.integer "product_subcategory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_subcategory_id"], name: "index_products_on_product_subcategory_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "shipping_cost_cents", null: false
    t.integer "priority", default: 0, null: false
    t.integer "shipment_mode", null: false
    t.string "province", null: false
    t.string "region", null: false
    t.date "shipment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "line_items", "customers"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "line_items", "shipments"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_subcategories"
end