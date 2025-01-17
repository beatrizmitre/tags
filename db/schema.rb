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

ActiveRecord::Schema[7.1].define(version: 2024_10_15_184124) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "print_button_clicks", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_print_button_clicks_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "placa_carro"
    t.string "nome_cliente"
    t.string "nome_mecanico"
    t.string "telefone"
    t.string "km_atual"
    t.string "oleo_utilizado"
    t.string "km_proxima_troca_oleo_motor"
    t.string "meses_proxima_troca_oleo_motor"
    t.string "km_proxima_troca_filtro_oleo"
    t.string "km_proxima_troca_filtro_ar_motor"
    t.string "km_proxima_troca_filtro_ar_condicionado"
    t.string "km_proxima_troca_filtro_oleo_combustivel"
    t.string "km_proxima_troca_diferencial"
    t.string "km_proxima_troca_oleo_cambio"
    t.string "km_proxima_troca_fluido_radiador"
    t.string "km_proxima_troca_oleo_freio"
    t.string "km_proximo_alinhamento"
    t.string "km_proximo_rodizio"
    t.string "km_proximo_balanceamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "km_proxima_troca_fluido_direcao"
    t.string "numero_pedido_bling"
    t.string "lembrar_cliente_em"
  end

  add_foreign_key "print_button_clicks", "tags"
end
