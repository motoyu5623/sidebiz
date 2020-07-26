class MergeJobColumnToMainAndSide < ActiveRecord::Migration[6.0]
  def change
    
    add_column :main_jobs, :name, :string, null: false
    add_column :main_jobs, :work_type, :string
    add_column :main_jobs, :company, :string
    add_column :main_jobs, :section, :string
    add_column :main_jobs, :industry, :string
    add_column :main_jobs, :medium, :string
    add_column :main_jobs, :occupation, :string
    add_column :main_jobs, :started_at, :date 
    add_column :main_jobs, :ended_at, :date 
    add_column :main_jobs, :worktime_week, :integer, null: false
    add_column :main_jobs, :income_month, :integer
    add_column :main_jobs, :description, :text, null: false

    add_column :side_jobs, :name, :string, null: false
    add_column :side_jobs, :work_type, :string
    add_column :side_jobs, :company, :string
    add_column :side_jobs, :section, :string
    add_column :side_jobs, :industry, :string
    add_column :side_jobs, :medium, :string
    add_column :side_jobs, :occupation, :string
    add_column :side_jobs, :started_at, :date 
    add_column :side_jobs, :ended_at, :date 
    add_column :side_jobs, :worktime_week, :integer, null: false
    add_column :side_jobs, :income_month, :integer
    add_column :side_jobs, :description, :text, null: false

    drop_table :jobs do |t|
      t.string "name", null: false
      t.string "work_type"
      t.string "section"
      t.string "industry"
      t.string "medium"
      t.string "occupation"
      t.date "started_at"
      t.date "ended_at"
      t.integer "worktime_week", null: false
      t.text "description", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "company"
      t.integer "income_month"
      t.bigint "user_id"
      t.index ["name"], name: "index_jobs_on_name"
      t.index ["user_id"], name: "index_jobs_on_user_id"
    end
  end
end
