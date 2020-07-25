class CreateJobOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_offers do |t|
      t.date :initial_date
      t.integer :salary
      t.string :benefits
      t.string :expectatives
      t.string :description
      t.references :job_opening, null: false, foreign_key: true
      t.references :head, null: false, foreign_key: true

      t.timestamps
    end
  end
end
