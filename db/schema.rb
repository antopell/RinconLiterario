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

ActiveRecord::Schema[7.1].define(version: 2024_06_28_023149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amistads", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "amigo_id", null: false
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amigo_id"], name: "index_amistads_on_amigo_id"
    t.index ["usuario_id", "amigo_id"], name: "index_amistads_on_usuario_id_and_amigo_id", unique: true
    t.index ["usuario_id"], name: "index_amistads_on_usuario_id"
  end

  create_table "lecturas", force: :cascade do |t|
    t.string "username"
    t.string "book_id"
    t.string "lecture_state"
    t.date "reading_start_date"
    t.date "reading_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "book_title"
    t.string "book_img"
    t.integer "total_pages"
  end

  create_table "logs_lecturas", force: :cascade do |t|
    t.string "username"
    t.string "lecture_id"
    t.integer "last_read_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nota", force: :cascade do |t|
    t.string "lecture_id"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "libro_id"
    t.integer "puntuacion"
    t.datetime "fecha"
    t.string "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usuario_id", null: false
    t.index ["usuario_id"], name: "index_reviews_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "mail"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "apellido"
    t.text "descripcion"
    t.string "email"
  end

  add_foreign_key "reviews", "usuarios"
end
