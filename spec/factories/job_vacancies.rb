# frozen_string_literal: true

FactoryBot.define do
  factory :job_vacancy do
    title { 'Mago' }
    job_description { 'Ser implacável' }
    desired_skills { 'magia' }
    income_range { 'R$1000,00 a R$2000,00' }
    job_level { 'pleno' }
    deadline { 3.days.from_now }
    area { 'A' }
    head
  end
end
