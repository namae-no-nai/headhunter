FactoryBot.define do
  factory :applicant do
    user
    full_name { 'Mago' }
    social_name { 'Eu' }
    birthdate { '11/11/1991' }
    academic { 'Ensino Superior' }
    description { 'Área de ensino em 5 anos' }
    experience { 'X anos' }
    photo { Rack::Test::UploadedFile.new('app/assets/download.jpeg', 'download.jpeg') }
  end
end