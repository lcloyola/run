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

ActiveRecord::Schema.define(:version => 20120317012320) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], :name => "index_categories_on_user_id"

  create_table "logs", :force => true do |t|
    t.integer  "tsession_id"
    t.integer  "set"
    t.integer  "repetition"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["tsession_id"], :name => "index_logs_on_tsession_id"

  create_table "members", :force => true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["team_id"], :name => "index_members_on_team_id"
  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "teams", ["user_id"], :name => "index_teams_on_user_id"

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "interval"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "templates", ["category_id"], :name => "index_templates_on_category_id"
  add_index "templates", ["user_id"], :name => "index_templates_on_user_id"

  create_table "tsessions", :force => true do |t|
    t.date     "trainingday"
    t.integer  "template_id"
    t.integer  "user_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tsessions", ["template_id"], :name => "index_tsessions_on_template_id"
  add_index "tsessions", ["user_id"], :name => "index_tsessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_coach",                              :default => true
    t.boolean  "is_athlete",                            :default => false
    t.integer  "coach_id"
    t.string   "last"
    t.string   "first"
    t.string   "middle"
    t.text     "about"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
