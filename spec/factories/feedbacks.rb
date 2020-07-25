# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    message { 'infelizmente não foi dessa vez' }
    job_opening
  end
end
