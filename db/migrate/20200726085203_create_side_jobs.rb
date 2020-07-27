class CreateSideJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :side_jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :main_job, null: false, foreign_key: true
      t.text :pulled_skill
      t.text :returned_skill

      t.timestamps
    end
  end
end
