FactoryBot.define do
  factory :head do
    sequence(:email) { |n| "teste#{n}@test.com.br" }
    password { '123456' }
  end
end
