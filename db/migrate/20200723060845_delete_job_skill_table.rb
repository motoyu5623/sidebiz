class DeleteJobSkillTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :job_skills
  end
end
