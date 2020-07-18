class AddAndRenameInJob < ActiveRecord::Migration[6.0]
  def change
    rename_column :jobs, :type, :work_type
    add_column :jobs, :company, :string
  end
end
