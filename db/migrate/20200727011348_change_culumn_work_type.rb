class ChangeCulumnWorkType < ActiveRecord::Migration[6.0]
  def change
    remove_column(:side_jobs, :work_type, :string)
    remove_column(:main_jobs, :work_type, :string)

    add_column(:side_jobs, :work_type, :integer)
    add_column(:main_jobs, :work_type, :integer)
  end
end
