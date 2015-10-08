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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20151006182952) do

  create_table "arts", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "arts_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "art_id"
    t.integer "niveau"
  end

  create_table "atouts", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.integer  "cout"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "has_detail"
    t.string   "source"
    t.string   "type_atout"
  end

  create_table "atouts_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "atout_id"
    t.string  "detail"
  end

  create_table "capacites", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.boolean  "primaire"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "type_cap"
    t.string   "source"
  end

  create_table "capacites_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "capacite_id"
    t.integer "niveau"
    t.string  "specialite"
  end

  create_table "combinaisons", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.integer  "cout"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.boolean  "secret"
  end

  create_table "combinaisons_disciplines", :force => true do |t|
    t.integer "combinaison_id"
    t.integer "discipline_id"
    t.integer "niveau"
  end

  create_table "combinaisons_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "combinaison_id"
  end

  create_table "disciplines", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.string   "nom_discipline"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "source"
    t.boolean  "secret"
    t.boolean  "meta_dis"
  end

  create_table "disciplines_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "discipline_id"
    t.integer "niveau"
    t.string  "voie"
  end

  create_table "historiques", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "has_detail"
    t.string   "source"
  end

  create_table "historiques_lieus", :force => true do |t|
    t.integer "historique_id"
    t.integer "lieu_id"
    t.integer "niveau"
  end

  create_table "historiques_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "historique_id"
    t.integer "niveau"
    t.string  "detail"
  end

  create_table "lieus", :force => true do |t|
    t.string   "nom"
    t.text     "description",          :limit => 255
    t.string   "type_lieu"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.boolean  "secret"
    t.text     "description_publique"
    t.string   "image_lien"
    t.decimal  "svg_x",                               :precision => 8, :scale => 2
    t.decimal  "svg_y",                               :precision => 8, :scale => 2
    t.string   "avatar"
  end

  create_table "lieus_organisations", :force => true do |t|
    t.integer  "lieu_id"
    t.integer  "organisation_id"
    t.string   "nom"
    t.text     "description"
    t.datetime "date_debut"
    t.datetime "date_fin"
  end

  create_table "lieus_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "lieu_id"
    t.string  "nom"
    t.text    "description"
  end

  create_table "nivdisciplines", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.integer  "niveau"
    t.string   "source"
    t.integer  "discipline_id"
    t.string   "discipline_nom"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "systeme"
    t.text     "tableau"
    t.boolean  "secret"
  end

  create_table "nivdisciplines_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "nivdiscipline_id"
  end

  create_table "objets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "niveau"
    t.string   "type_objet"
    t.string   "resonnance"
    t.integer  "personnage_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "secret"
    t.integer  "valeur"
    t.integer  "dynamique"
    t.integer  "statique"
    t.integer  "entropique"
    t.integer  "user_id"
  end

  create_table "objets_routines", :force => true do |t|
    t.integer "objet_id"
    t.integer "routine_id"
  end

  create_table "organisations", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.string   "type_organisation"
    t.datetime "date"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.boolean  "secret"
    t.text     "description_publique"
    t.string   "image_lien"
    t.string   "avatar"
  end

  create_table "organisations_personnages", :force => true do |t|
    t.integer  "personnage_id"
    t.integer  "organisation_id"
    t.string   "nom"
    t.text     "description"
    t.datetime "date_debut"
    t.datetime "date_fin"
  end

  create_table "parties", :force => true do |t|
    t.datetime "date"
    t.integer  "duree"
    t.string   "nom"
    t.text     "description"
    t.text     "description_publique"
    t.boolean  "secret"
    t.string   "image_lien"
    t.integer  "xps"
    t.text     "notes"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "parties_personnages", :force => true do |t|
    t.integer "personnage_id"
    t.integer "partie_id"
  end

  create_table "personnages", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.datetime "date_naissance"
    t.text     "description"
    t.integer  "volonte"
    t.text     "background"
    t.integer  "force"
    t.integer  "dexterite"
    t.integer  "vigueur"
    t.integer  "charisme"
    t.integer  "manipulation"
    t.integer  "apparence"
    t.integer  "perception"
    t.integer  "intelligence"
    t.integer  "astuce"
    t.text     "paradygme"
    t.integer  "xps"
    t.integer  "bonus"
    t.datetime "date_mort"
    t.integer  "points_conscience"
    t.integer  "points_maitrise"
    t.integer  "points_courage"
    t.integer  "points_dynamique"
    t.integer  "points_statique"
    t.integer  "points_entropique"
    t.integer  "entelechie"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "spec_force"
    t.string   "spec_dexterite"
    t.string   "spec_vigueur"
    t.string   "spec_charisme"
    t.string   "spec_manipulation"
    t.string   "spec_apparence"
    t.string   "spec_perception"
    t.string   "spec_intelligence"
    t.string   "spec_astuce"
    t.integer  "reste_xps"
    t.string   "type_perso"
    t.string   "nature"
    t.string   "attitude"
    t.integer  "rang"
    t.integer  "points_sang"
    t.integer  "glamour"
    t.integer  "banalite"
    t.integer  "niveau_voie"
    t.string   "voie"
    t.string   "tradition"
    t.string   "clan"
    t.text     "caracteristique_base"
    t.text     "caracteristique_bonus"
    t.string   "reste_bonus"
    t.boolean  "has_base"
    t.boolean  "has_bonus"
    t.integer  "user_id"
    t.boolean  "secret",                :default => false
    t.text     "description_publique"
    t.string   "image_lien"
    t.integer  "niveau_physique"
    t.integer  "niveau_social"
    t.integer  "niveau_mental"
    t.integer  "niveau_magdynamique"
    t.integer  "niveau_magstatique"
    t.integer  "niveau_ressources"
    t.boolean  "pnj",                   :default => false
    t.string   "nom_publique"
    t.string   "detail_dynamique"
    t.string   "detail_statique"
    t.string   "detail_entropique"
    t.string   "avatar"
    t.string   "appartenance_perso"
  end

  create_table "personnages_routines", :force => true do |t|
    t.integer "personnage_id"
    t.integer "routine_id"
  end

  create_table "personnages_royaumes", :force => true do |t|
    t.integer "personnage_id"
    t.integer "royaume_id"
    t.integer "niveau"
  end

  create_table "relations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.integer  "to_personnage_id"
    t.integer  "from_personnage_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "secret"
  end

  create_table "routines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "foci"
    t.string   "combinaison"
    t.string   "type_routine"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.boolean  "secret"
    t.integer  "nbs_succes"
    t.integer  "nbs_quintessence"
    t.boolean  "volonte_permanente"
    t.text     "effet"
    t.integer  "correspondance"
    t.integer  "entropie"
    t.integer  "esprit"
    t.integer  "forces"
    t.integer  "matiere"
    t.integer  "prime"
    t.integer  "psyche"
    t.integer  "temps"
    t.integer  "vie"
    t.integer  "user_id"
  end

  create_table "royaumes", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "spheres", :force => true do |t|
    t.string   "name"
    t.string   "specialite"
    t.text     "description"
    t.integer  "niveau"
    t.integer  "personnage_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "pseudo"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role",                   :default => 0,  :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
