# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151007190302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "curriculums", force: :cascade do |t|
    t.integer  "profesor_id"
    t.string   "profesor_type"
    t.date     "fechaNacimiento"
    t.string   "rfc"
    t.text     "areaEspecializacion"
    t.text     "formacionUltimoGrado"
    t.text     "formacionCursoActualizacion"
    t.text     "experienciaDocente"
    t.text     "cargosAcademicos"
    t.text     "revisorOtros"
    t.text     "publicaciones"
    t.text     "ponenciasConferenciasCongresos"
    t.text     "formacionRecursosHumanos"
    t.text     "cursosImpartidos"
    t.string   "experienciaEntidadAcademica"
    t.text     "experienciaAreaCurso"
    t.text     "reconocimientos"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "curriculums", ["profesor_type", "profesor_id"], name: "index_curriculums_on_profesor_type_and_profesor_id", using: :btree

  create_table "cursandos", force: :cascade do |t|
    t.integer  "curso_id"
    t.integer  "alumno_id"
    t.string   "alumno_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cursandos", ["alumno_type", "alumno_id"], name: "index_cursandos_on_alumno_type_and_alumno_id", using: :btree
  add_index "cursandos", ["curso_id"], name: "index_cursandos_on_curso_id", using: :btree

  create_table "cursos", force: :cascade do |t|
    t.integer  "profesor_id"
    t.string   "profesor_type"
    t.date     "inicia"
    t.date     "finaliza"
    t.boolean  "aprovado"
    t.string   "tipo"
    t.string   "modalidad"
    t.string   "fechas"
    t.string   "diasHorario"
    t.integer  "numeroSesiones"
    t.integer  "numeroHoras"
    t.integer  "minInscritos"
    t.integer  "maxInscritos"
    t.float    "costoPublicoGeneral"
    t.float    "costoUNAM"
    t.float    "pagoPropuestoDocentes"
    t.text     "materialApoyo"
    t.text     "equipoComputo"
    t.text     "materialRequeridoAlumnos"
    t.text     "materialApoyoAlumnos"
    t.text     "descripcionCurso"
    t.text     "objetivosGeneral"
    t.text     "objetivosEspecifico"
    t.text     "metas"
    t.text     "dirigidoA"
    t.text     "procesoEvaluacion"
    t.text     "requisitosIngreso"
    t.text     "requisitosPermanencia"
    t.text     "requisitosEgreso"
    t.text     "bibliografia"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cursos", ["profesor_type", "profesor_id"], name: "index_cursos_on_profesor_type_and_profesor_id", using: :btree

  create_table "docentes", force: :cascade do |t|
    t.integer  "curso_id"
    t.string   "nombre"
    t.string   "grado"
    t.string   "cargo"
    t.string   "entidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "docentes", ["curso_id"], name: "index_docentes_on_curso_id", using: :btree

  create_table "interesados", force: :cascade do |t|
    t.integer  "curso_id"
    t.string   "nombre"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interesados", ["curso_id"], name: "index_interesados_on_curso_id", using: :btree

  create_table "publicidads", force: :cascade do |t|
    t.integer  "curso_id"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "publicidads", ["curso_id"], name: "index_publicidads_on_curso_id", using: :btree

  create_table "sesions", force: :cascade do |t|
    t.integer  "curso_id"
    t.integer  "numeroHorasSesion"
    t.integer  "totalHoras"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sesions", ["curso_id"], name: "index_sesions_on_curso_id", using: :btree

  create_table "telefonos", force: :cascade do |t|
    t.string   "numero"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "telefonos", ["usuario_id"], name: "index_telefonos_on_usuario_id", using: :btree

  create_table "temarios", force: :cascade do |t|
    t.integer  "curso_id"
    t.text     "tema"
    t.integer  "numeroHoras"
    t.text     "ponente"
    t.string   "fechas"
    t.text     "subtemas"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "temarios", ["curso_id"], name: "index_temarios_on_curso_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellidoPaterno"
    t.string   "apellidoMaterno"
    t.string   "contrasena"
    t.string   "email"
    t.string   "direccion"
    t.boolean  "pago"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree

  add_foreign_key "cursandos", "cursos"
  add_foreign_key "docentes", "cursos"
  add_foreign_key "interesados", "cursos"
  add_foreign_key "publicidads", "cursos"
  add_foreign_key "sesions", "cursos"
  add_foreign_key "telefonos", "usuarios"
  add_foreign_key "temarios", "cursos"
end
