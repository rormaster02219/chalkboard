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

ActiveRecord::Schema.define(version: 20150823233126) do

  create_table "active_admin_comments", force: true do |t|
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

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attendees", force: true do |t|
    t.integer  "classroom_id"
    t.integer  "student_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
  end

  add_index "attendees", ["classroom_id"], name: "index_attendees_on_classroom_id", using: :btree
  add_index "attendees", ["student_id"], name: "index_attendees_on_student_id", using: :btree

  create_table "classrooms", force: true do |t|
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size"
    t.integer  "waitlist"
    t.datetime "date_of"
    t.string   "subject"
    t.string   "classname"
    t.string   "status"
  end

  create_table "exam_dates", force: true do |t|
    t.string   "subject"
    t.date     "exam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "modes", force: true do |t|
    t.integer  "student_id"
    t.integer  "points"
    t.date     "latest_activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pins", force: true do |t|
    t.boolean  "used"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "question"
    t.string   "choice_a"
    t.string   "choice_b"
    t.string   "choice_c"
    t.string   "choice_d"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "module_test"
    t.string   "subject"
    t.integer  "number"
    t.string   "module_test_name"
    t.integer  "timer"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "solution"
    t.string   "image_solution_file_name"
    t.string   "image_solution_content_type"
    t.integer  "image_solution_file_size"
    t.datetime "image_solution_updated_at"
    t.string   "choice_a_image_file_name"
    t.string   "choice_a_image_content_type"
    t.integer  "choice_a_image_file_size"
    t.datetime "choice_a_image_updated_at"
    t.string   "choice_b_image_file_name"
    t.string   "choice_b_image_content_type"
    t.integer  "choice_b_image_file_size"
    t.datetime "choice_b_image_updated_at"
    t.string   "choice_c_image_file_name"
    t.string   "choice_c_image_content_type"
    t.integer  "choice_c_image_file_size"
    t.datetime "choice_c_image_updated_at"
    t.string   "choice_d_image_file_name"
    t.string   "choice_d_image_content_type"
    t.integer  "choice_d_image_file_size"
    t.datetime "choice_d_image_updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "question_id"
    t.integer  "student_id"
    t.boolean  "correct"
    t.string   "student_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "module_test"
    t.string   "subject"
    t.integer  "number"
    t.string   "module_test_name"
  end

  create_table "students", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "first"
    t.string   "last"
    t.integer  "age"
    t.string   "school"
    t.integer  "grade"
    t.string   "island"
    t.string   "remember_token"
    t.string   "gender"
    t.string   "activation_token"
    t.boolean  "active"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["remember_token"], name: "index_students_on_remember_token", using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "student_id"
    t.string   "email"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
    t.string   "activity"
  end

  create_table "subscriptions_adds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackings", force: true do |t|
    t.string   "module_test"
    t.string   "subject"
    t.integer  "question"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "module_test_name"
  end

end
