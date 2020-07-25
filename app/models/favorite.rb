# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :applicant
  belongs_to :head

  scope :search, lambda { |applicant_id, head_id|
                   where('applicant_id = ? AND head_id = ? ',
                         applicant_id, head_id).take
                 }
end
