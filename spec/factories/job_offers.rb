FactoryBot.define do
  factory :job_offer do
    initial_date { 3.day.from_now }
    salary { 9001.00 }
    benefits { "Muitas coisas, tantas que eu não posso nem dizer" }
    expectatives { "Pro atividade, Trabalho em grupo, desafiar limites" }
    description { "outras muitas coisas que acabam não acontecendo não sei" }
    head
  end
end
