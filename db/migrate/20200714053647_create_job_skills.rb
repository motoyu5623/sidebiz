class CreateJobSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :job_skills do |t|
      t.references :job, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :score

      t.timestamps
    end
    add_index :job_skills, [:job_id, :skill_id], unique: true
  end
end
