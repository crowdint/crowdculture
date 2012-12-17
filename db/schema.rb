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

ActiveRecord::Schema.define(:version => 20121217162712) do

  create_table "entries", :force => true do |t|
    t.integer  "feed_id"
    t.string   "content_url"
    t.datetime "published_date"
    t.string   "title"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "entry_id"
    t.string   "type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "box_size",            :default => 1
    t.string   "special_tag",         :default => "none"
  end

  add_index "entries", ["entry_id"], :name => "altered_entries_id_index", :unique => true
  add_index "entries", ["published_date"], :name => "altered_entries_published_date_index"
  add_index "entries", ["title"], :name => "altered_entries_title_index"
  add_index "entries", ["type"], :name => "index_entries_on_content_type"

  create_table "feeds", :force => true do |t|
    t.string   "url"
    t.string   "author"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
