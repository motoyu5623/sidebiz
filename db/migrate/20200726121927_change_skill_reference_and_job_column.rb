class ChangeSkillReferenceAndJobColumn < ActiveRecord::Migration[6.0]
  def change
    remove_reference :skills, :job
    add_reference :skills, :side_job, foreign_key: true

    remove_reference :jobs, :user
    remove_column :jobs, :pulled_skill
    remove_column :jobs, :returned_skill
    remove_column :jobs, :is_main
    add_column :jobs, :income_month, :integer
  end
end
