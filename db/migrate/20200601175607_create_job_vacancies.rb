# frozen_string_literal: true

class CreateJobVacancies < ActiveRecord::Migration[6.0]
  def change
    create_table :job_vacancies do |t|
      t.string :title
      t.string :job_description
      t.string :desired_skills
      t.string :income_range
      t.string :job_level
      t.date :deadline
      t.string :area
      t.references :head, null: false, foreign_key: true

      t.timestamps
    end
  end
end
