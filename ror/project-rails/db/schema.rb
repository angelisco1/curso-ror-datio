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

ActiveRecord::Schema.define(version: 2019_09_20_104202) do

  create_table "categorias", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredientes", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "categoria_id"
    t.index ["categoria_id"], name: "index_ingredientes_on_categoria_id"
  end

  create_table "ingredientes_recetas", force: :cascade do |t|
    t.integer "ingrediente_id", null: false
    t.integer "receta_id", null: false
    t.string "cantidad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingrediente_id"], name: "index_ingredientes_recetas_on_ingrediente_id"
    t.index ["receta_id"], name: "index_ingredientes_recetas_on_receta_id"
  end

  create_table "recetas", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "puntuacion"
    t.boolean "publica"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "usuario_id"
    t.index ["usuario_id"], name: "index_recetas_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "username", null: false
    t.string "nombre", default: "", null: false
    t.string "apellidos", default: "", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredientes", "categorias"
  add_foreign_key "ingredientes_recetas", "ingredientes"
  add_foreign_key "ingredientes_recetas", "recetas"
end
