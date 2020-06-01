class Applicant < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  validates :full_name, :social_name, :birthdate, :academic, :description,
            :experience, presence: true
  validates :description, length: { maximum: 1000 }
  validate :older_than_sixteen

  enum feedback: { mvp: 0,
                   not_mvp: 1,
                  }

  def older_than_sixteen
    if birthdate.present? && birthdate > 16.years.ago
      errors.add(:birthdate, 'não pode ser menos que 16 anos')
    end
  end
end
