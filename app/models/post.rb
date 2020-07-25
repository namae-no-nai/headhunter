# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :applicant
  belongs_to :head

  validates :content, presence: true
  validates :content, length: { maximum: 500 }
end
