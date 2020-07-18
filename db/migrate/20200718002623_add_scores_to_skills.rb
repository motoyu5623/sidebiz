class AddScoresToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :importance_for_side_job, :integer
    add_column :skills, :importance_for_main_job, :integer
  end
end
