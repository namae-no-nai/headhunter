class Feedback < ApplicationRecord
  belongs_to :job_opening

  validates :message, length: { maximum: 500 }
end
