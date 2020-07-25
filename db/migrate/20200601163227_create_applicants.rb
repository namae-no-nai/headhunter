# frozen_string_literal: true

class CreateApplicants < ActiveRecord::Migration[6.0]
  def change
    create_table :applicants do |t|
      t.string :full_name
      t.string :social_name
      t.date :birthdate
      t.string :academic
      t.string :description
      t.string :experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
