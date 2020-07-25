# frozen_string_literal: true

class CreateHeadProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :head_profiles do |t|
      t.references :head

      t.timestamps
    end
  end
end
