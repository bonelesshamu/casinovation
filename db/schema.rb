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

ActiveRecord::Schema.define(version: 20161115145247) do

  create_table "operator_members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_results", force: :cascade do |t|
    t.integer "answer1", default: 0
    t.integer "answer2", default: 0
    t.integer "answer3", default: 0
    t.integer "answer4", default: 0
    t.integer "answer5", default: 0
  end

  create_table "staff_member_options", force: :cascade do |t|
    t.string  "name",                     null: false
    t.string  "question",                 null: false
    t.string  "option"
    t.integer "bet"
    t.boolean "correct",  default: false
  end

  create_table "staff_members", force: :cascade do |t|
    t.string  "name",                           null: false
    t.integer "coin",                           null: false
    t.integer "prize1_bet"
    t.boolean "prize1_winner",  default: false
    t.integer "prize2_bet"
    t.boolean "prize2_winner",  default: false
    t.integer "prize3_bet"
    t.boolean "prize3_winner",  default: false
    t.integer "prize4_bet"
    t.boolean "prize4_winner",  default: false
    t.integer "prize5_bet"
    t.boolean "prize5_winner",  default: false
    t.boolean "prize_bet_flag", default: false
  end

end
