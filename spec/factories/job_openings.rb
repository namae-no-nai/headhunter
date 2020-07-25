# frozen_string_literal: true

FactoryBot.define do
  factory :job_opening do
    letter { 'MyString' }
    status { 1 }
    applicant
    job_vacancy
  end
end
