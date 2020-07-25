# frozen_string_literal: true

class JobOffer < ApplicationRecord
  belongs_to :job_opening
  belongs_to :head

  validates :initial_date, :salary, :benefits, :expectatives, :description,
            presence: true
  validates :benefits, :expectatives, :description, length: { maximum: 4000 }
  validates :salary, numericality: { greater_than: 0 }
  validate :valid_date

  def valid_date
    errors.add(:initial_date, 'não pode ser anterior a hoje') if initial_date.present? && initial_date < Date.today
  end
end
