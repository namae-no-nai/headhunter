# frozen_string_literal: true

class JobOpening < ApplicationRecord
  belongs_to :applicant
  belongs_to :job_vacancy

  validates :letter, presence: true
  validates :letter, length: { maximum: 500 }

  enum status: { refused: 0,
                 on_hold: 1,
                 accepted: 2 }
end
