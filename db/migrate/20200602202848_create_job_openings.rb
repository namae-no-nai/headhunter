class CreateJobOpenings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_openings do |t|
      t.string :letter
      t.integer :status, default: 0
      t.references :applicant, null: false, foreign_key: true
      t.references :job_vacancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
