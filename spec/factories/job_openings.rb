FactoryBot.define do
  factory :job_opening do
    letter { "MyString" }
    status {2}
    applicant
    job_vacancy
  end
end
