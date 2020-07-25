# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    applicant
    head
    content { 'Um post' }
  end
end
