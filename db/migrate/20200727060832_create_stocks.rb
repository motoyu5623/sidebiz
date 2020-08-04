class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :side_job, null: false, foreign_key: true

      t.timestamps
      t.index %i[user_id side_job_id], unique: true
    end
  end
end
