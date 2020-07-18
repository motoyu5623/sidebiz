class AddIndexToSkills < ActiveRecord::Migration[6.0]
  def change
    add_reference :skills, :job
  end
end
