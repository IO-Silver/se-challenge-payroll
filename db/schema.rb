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

ActiveRecord::Schema[7.1].define(version: 2024_07_27_222110) do
  create_table "employees", force: :cascade do |t|
    t.string "job_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_employees_on_id", unique: true
    t.index ["job_group_id"], name: "index_employees_on_job_group_id"
  end

  create_table "job_groups", primary_key: "name", id: :string, force: :cascade do |t|
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records_of_work", force: :cascade do |t|
    t.float "hours"
    t.date "date"
    t.date "pay_period_start"
    t.date "pay_period_end"
    t.integer "report_id"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_records_of_work_on_employee_id"
    t.index ["report_id"], name: "index_records_of_work_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "job_groups", primary_key: "name"
end
