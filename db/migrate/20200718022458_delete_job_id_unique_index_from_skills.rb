class DeleteJobIdUniqueIndexFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_index :skills, :name
    add_index :skills, :name
  end
end
