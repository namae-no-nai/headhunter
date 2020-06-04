class JobOffer < ApplicationRecord
  belongs_to :job_opening

  validates :initial_date, :salary, :benefits, :expectatives, :description,
             presence: true
  validates :benefits, :expectatives, :description, length: { maximum: 4000 }
  validates :salary, numericality: {greater_than: 0}
  validate :valid_date

  def valid_date
    if initial_date.present? && initial_date < Date.today
      errors.add(:initial_date, 'não pode ser anterior a hoje')
    end
  end
end
