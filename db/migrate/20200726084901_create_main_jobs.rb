class CreateMainJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :main_jobs do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
