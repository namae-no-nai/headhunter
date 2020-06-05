FactoryBot.define do
  factory :reply_offer do
    answer { 'Aceito' }
    message { 'Obrigado pela oportunidade' }
    job_offer 
  end
end
