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

ActiveRecord::Schema[7.1].define(version: 2024_04_12_160102) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foos", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pub_sub_outbox_messages", force: :cascade do |t|
    t.string "publisher_type", null: false
    t.bigint "publisher_id", null: false
    t.json "payload", null: false
    t.boolean "published", null: false
    t.integer "sequence_number", default: 0, null: false
    t.uuid "updated_uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["published"], name: "index_pub_sub_outbox_messages_on_published"
    t.index ["publisher_type", "publisher_id"], name: "idx_on_publisher_type_publisher_id_ff427ce920", unique: true
    t.index ["publisher_type", "publisher_id"], name: "index_pub_sub_outbox_messages_on_publisher"
    t.index ["updated_uuid"], name: "index_pub_sub_outbox_messages_on_updated_uuid", unique: true
  end

end
