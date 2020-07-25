class JobVacancy < ApplicationRecord
  belongs_to :head
  
  validates :title, :job_description, :desired_skills, :income_range,
            :job_level, :deadline, :area,
            presence: true, length: { maximum: 4000 }
  validate :valid_date

  scope :search, lambda { |query|
                   where('title LIKE ?', "%#{query}%")
                     .or(where('job_description LIKE ?', "%#{query}%"))
                 }

  def valid_date
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, 'não pode ser anterior a hoje')
    end
  end
end
