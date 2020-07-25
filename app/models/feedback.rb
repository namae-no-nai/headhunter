class Feedback < ApplicationRecord
  belongs_to :job_opening

  validates :message, presence: true
  validates :message, length: { maximum: 500 }
end
