class CreateReplyOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_offers do |t|
      t.string :answer
      t.string :message
      t.references :job_offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
