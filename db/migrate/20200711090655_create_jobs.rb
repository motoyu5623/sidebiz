class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string     :name, null: false
      t.string     :type
      t.string     :section
      t.string     :industry
      t.string     :medium
      t.string     :occupation
      t.date       :started_at
      t.date       :ended_at
      t.integer    :worktime_week, null: false
      t.text       :description, null: false
      t.text       :pulled_skill, null: false
      t.text       :returned_skill, null: false
      t.boolean    :is_main, default: false
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :jobs, :user_id
    add_index :jobs, :name

  end
end
