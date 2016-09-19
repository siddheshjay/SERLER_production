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

ActiveRecord::Schema.define(version: 20160919085122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evidence_items", force: :cascade do |t|
    t.integer  "evidence_id"
    t.integer  "paper_id"
    t.text     "benefit_comeout"
    t.text     "context"
    t.text     "confidence_rate"
    t.text     "integrity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "evidence_method", id: false, force: :cascade do |t|
    t.integer "evidence_item_id", null: false
    t.integer "se_method_id",     null: false
  end

  create_table "evidence_source_authors", force: :cascade do |t|
    t.integer  "evidence_source_id"
    t.string   "name"
    t.string   "name_abbr"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["evidence_source_id"], name: "index_evidence_source_authors_on_evidence_source_id", using: :btree
    t.index ["name"], name: "index_evidence_source_authors_on_name", using: :btree
    t.index ["name_abbr"], name: "index_evidence_source_authors_on_name_abbr", using: :btree
  end

  create_table "evidence_sources", force: :cascade do |t|
    t.string   "status",                 null: false
    t.integer  "submitter_id",           null: false
    t.string   "submitter_email",        null: false
    t.integer  "moderator_id"
    t.string   "moderator_email"
    t.integer  "analyst_id"
    t.string   "analyst_email"
    t.datetime "moderated_time"
    t.datetime "published_time"
    t.string   "category"
    t.string   "title",                  null: false
    t.integer  "year"
    t.string   "month"
    t.string   "source_title"
    t.string   "publisher"
    t.string   "URL"
    t.string   "DOI"
    t.integer  "volume_number"
    t.integer  "issue_number"
    t.string   "page_str"
    t.integer  "page_begin"
    t.integer  "page_cease"
    t.integer  "rating_tenth"
    t.integer  "rating_tenth_avg"
    t.integer  "rating_tenth_moderated"
    t.text     "research_aim"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["DOI"], name: "index_evidence_sources_on_DOI", using: :btree
    t.index ["analyst_id"], name: "index_evidence_sources_on_analyst_id", using: :btree
    t.index ["moderator_id"], name: "index_evidence_sources_on_moderator_id", using: :btree
    t.index ["page_begin"], name: "index_evidence_sources_on_page_begin", using: :btree
    t.index ["page_cease"], name: "index_evidence_sources_on_page_cease", using: :btree
    t.index ["publisher"], name: "index_evidence_sources_on_publisher", using: :btree
    t.index ["rating_tenth"], name: "index_evidence_sources_on_rating_tenth", using: :btree
    t.index ["source_title"], name: "index_evidence_sources_on_source_title", using: :btree
    t.index ["status"], name: "index_evidence_sources_on_status", using: :btree
    t.index ["submitter_id"], name: "index_evidence_sources_on_submitter_id", using: :btree
    t.index ["title"], name: "index_evidence_sources_on_title", using: :btree
    t.index ["year"], name: "index_evidence_sources_on_year", using: :btree
  end

  create_table "methodologies", primary_key: "methodology_id", force: :cascade do |t|
    t.text     "methodology_name"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "news", primary_key: "news_id", force: :cascade do |t|
    t.text     "news_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_id"], name: "index_notifications_on_news_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "papers", primary_key: "paper_id", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "paper_status"
    t.integer  "moderator_id"
    t.datetime "moderated_time"
    t.integer  "analyst_id"
    t.datetime "analysed_time"
    t.text     "authors"
    t.text     "title"
    t.text     "journal"
    t.text     "year"
    t.text     "volume"
    t.text     "pages"
    t.text     "month"
    t.integer  "credibility_rate"
    t.text     "research_metrix"
    t.text     "research_aim"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "participants", primary_key: "participate_id", force: :cascade do |t|
    t.text     "participate_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "participants_papers", id: false, force: :cascade do |t|
    t.integer "paper_id"
    t.integer "participant_id"
    t.index ["paper_id"], name: "index_participants_papers_on_paper_id", using: :btree
    t.index ["participant_id"], name: "index_participants_papers_on_participant_id", using: :btree
  end

  create_table "research_methods", primary_key: "research_method_id", force: :cascade do |t|
    t.text     "method_name"
    t.integer  "method_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "research_methods_papers", id: false, force: :cascade do |t|
    t.integer "research_method_id"
    t.integer "paper_id"
    t.index ["paper_id"], name: "index_research_methods_papers_on_paper_id", using: :btree
    t.index ["research_method_id"], name: "index_research_methods_papers_on_research_method_id", using: :btree
  end

  create_table "se_methods", primary_key: "method_id", force: :cascade do |t|
    t.text     "method_name"
    t.integer  "methodology_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "search_fields", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "search_id"
    t.string   "content"
    t.string   "field"
    t.string   "op1"
    t.string   "op2"
    t.index ["search_id"], name: "index_search_fields_on_search_id", using: :btree
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.date     "saved_on"
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "roles_mask"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "evidence_items", "papers", primary_key: "paper_id"
  add_foreign_key "evidence_source_authors", "evidence_sources"
  add_foreign_key "papers", "users", column: "analyst_id"
  add_foreign_key "papers", "users", column: "moderator_id"
  add_foreign_key "se_methods", "methodologies", primary_key: "methodology_id"
  add_foreign_key "search_fields", "searches"
end
