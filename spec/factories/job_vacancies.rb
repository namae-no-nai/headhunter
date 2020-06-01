FactoryBot.define do
  factory :job_vacancy do
    title { "MyString" }
    job_description { "MyString" }
    desired_skills { "MyString" }
    income_range { "MyString" }
    job_level { "MyString" }
    deadline { "2020-06-01" }
    area { "MyString" }
    head { nil }
  end
end
