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

ActiveRecord::Schema.define(version: 20150516015804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
  end

  create_table "article_officers", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "officer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.date     "date"
    t.integer  "state_id"
    t.string   "city"
    t.string   "address"
    t.string   "zipcode"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "avatar"
    t.string   "slug"
    t.string   "video_url"
    t.string   "state"
    t.integer  "age"
    t.integer  "agency_id"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "articles_officers", id: false, force: :cascade do |t|
    t.integer "articles_id"
    t.integer "officers_id"
  end

  add_index "articles_officers", ["articles_id"], name: "index_articles_officers_on_articles_id", using: :btree
  add_index "articles_officers", ["officers_id"], name: "index_articles_officers_on_officers_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "links", ["article_id"], name: "index_links_on_article_id", using: :btree

  create_table "officers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "department_id"
    t.string   "avatar"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.text     "background"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ansi_code"
  end

  create_table "storytime_actions", force: :cascade do |t|
    t.string   "name"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storytime_actions", ["guid"], name: "index_storytime_actions_on_guid", using: :btree

  create_table "storytime_autosaves", force: :cascade do |t|
    t.text     "content"
    t.integer  "autosavable_id"
    t.string   "autosavable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_autosaves", ["autosavable_type", "autosavable_id"], name: "autosavable_index", using: :btree
  add_index "storytime_autosaves", ["site_id"], name: "index_storytime_autosaves_on_site_id", using: :btree

  create_table "storytime_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_comments", ["post_id"], name: "index_storytime_comments_on_post_id", using: :btree
  add_index "storytime_comments", ["site_id"], name: "index_storytime_comments_on_site_id", using: :btree
  add_index "storytime_comments", ["user_id"], name: "index_storytime_comments_on_user_id", using: :btree

  create_table "storytime_media", force: :cascade do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_media", ["site_id"], name: "index_storytime_media_on_site_id", using: :btree
  add_index "storytime_media", ["user_id"], name: "index_storytime_media_on_user_id", using: :btree

  create_table "storytime_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "storytime_role_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storytime_memberships", ["site_id"], name: "index_storytime_memberships_on_site_id", using: :btree
  add_index "storytime_memberships", ["storytime_role_id"], name: "index_storytime_memberships_on_storytime_role_id", using: :btree
  add_index "storytime_memberships", ["user_id"], name: "index_storytime_memberships_on_user_id", using: :btree

  create_table "storytime_permissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_permissions", ["action_id"], name: "index_storytime_permissions_on_action_id", using: :btree
  add_index "storytime_permissions", ["role_id"], name: "index_storytime_permissions_on_role_id", using: :btree
  add_index "storytime_permissions", ["site_id"], name: "index_storytime_permissions_on_site_id", using: :btree

  create_table "storytime_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.text     "excerpt"
    t.datetime "published_at"
    t.integer  "featured_media_id"
    t.boolean  "featured",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "secondary_media_id"
    t.integer  "site_id"
    t.boolean  "notifications_enabled", default: false
    t.datetime "notifications_sent_at"
    t.integer  "blog_id"
  end

  add_index "storytime_posts", ["blog_id"], name: "index_storytime_posts_on_blog_id", using: :btree
  add_index "storytime_posts", ["slug"], name: "index_storytime_posts_on_slug", using: :btree
  add_index "storytime_posts", ["user_id"], name: "index_storytime_posts_on_user_id", using: :btree

  create_table "storytime_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storytime_roles", ["name"], name: "index_storytime_roles_on_name", using: :btree

  create_table "storytime_sites", force: :cascade do |t|
    t.string   "title"
    t.integer  "post_slug_style",         default: 0
    t.string   "ga_tracking_id"
    t.integer  "root_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subscription_email_from"
    t.string   "layout"
    t.string   "disqus_forum_shortname"
    t.integer  "user_id"
    t.string   "custom_domain"
    t.string   "discourse_name"
  end

  add_index "storytime_sites", ["root_post_id"], name: "index_storytime_sites_on_root_post_id", using: :btree
  add_index "storytime_sites", ["user_id"], name: "index_storytime_sites_on_user_id", using: :btree

  create_table "storytime_snippets", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_snippets", ["name"], name: "index_storytime_snippets_on_name", using: :btree

  create_table "storytime_subscriptions", force: :cascade do |t|
    t.string   "email"
    t.boolean  "subscribed", default: true
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_subscriptions", ["token"], name: "index_storytime_subscriptions_on_token", using: :btree

  create_table "storytime_taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_taggings", ["post_id"], name: "index_storytime_taggings_on_post_id", using: :btree
  add_index "storytime_taggings", ["site_id"], name: "index_storytime_taggings_on_site_id", using: :btree
  add_index "storytime_taggings", ["tag_id"], name: "index_storytime_taggings_on_tag_id", using: :btree

  create_table "storytime_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "storytime_versions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "versionable_id"
    t.string   "versionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_versions", ["site_id"], name: "index_storytime_versions_on_site_id", using: :btree
  add_index "storytime_versions", ["user_id"], name: "index_storytime_versions_on_user_id", using: :btree
  add_index "storytime_versions", ["versionable_type", "versionable_id"], name: "versionable_index", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "storytime_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.string   "ip"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "links", "articles"
end
