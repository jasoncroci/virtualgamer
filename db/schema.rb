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

ActiveRecord::Schema.define(:version => 20130316171242) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data_blocks", :force => true do |t|
    t.string   "name"
    t.integer  "size"
    t.integer  "level"
    t.integer  "speed"
    t.integer  "hit_points"
    t.integer  "armor_class"
    t.integer  "shareable_id"
    t.string   "shareable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "monsters", :force => true do |t|
    t.string   "display_name"
    t.integer  "type"
    t.integer  "experience_points"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "race"
    t.string   "class_name"
    t.integer  "alignment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
