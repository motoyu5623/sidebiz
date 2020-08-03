class RemakeJobAndRemoveNullFalse < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
    end

    change_column_null(:users, :birthday, true)
    change_column_null(:main_jobs, :description, true)
  end
end
