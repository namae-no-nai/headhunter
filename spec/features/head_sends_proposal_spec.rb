# frozen_string_literal: true

require 'rails_helper'

feature 'head sends proposal' do
  scenario 'sucessfully' do
    head = create(:head)
    job_vacancy = create(:job_vacancy, head: head)
    applicant = create(:applicant)
    create(:job_opening, job_vacancy: job_vacancy,
                                       applicant: applicant)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver detalhes'
    click_on 'Aceitar e enviar Proposta'
    fill_in 'Data de início', with: 3.day.from_now
    fill_in 'Salário', with: '9001'
    fill_in 'Benefícios', with: 'Muitas coisas, tantas que eu não posso nem dizer'
    fill_in 'Informações adicionais', with: 'Pro atividade, Trabalho em grupo, desafiar limites'
    fill_in 'Expectativas', with: 'outras muitas coisas que acabam não acontecendo não sei'
    click_on 'Enviar'

    expect(current_path).to eq(job_vacancy_path(job_vacancy))
    expect(page).to have_content('Proposta enviada')
  end

  scenario 'cannot be blank' do
    head = create(:head)
    job_vacancy = create(:job_vacancy, head: head)
    applicant = create(:applicant)
    create(:job_opening, job_vacancy: job_vacancy,
                                       applicant: applicant)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver detalhes'
    click_on 'Aceitar e enviar Proposta'
    fill_in 'Data de início', with: ''
    fill_in 'Salário', with: ''
    fill_in 'Benefícios', with: ''
    fill_in 'Informações adicionais', with: ''
    fill_in 'Expectativas', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Data de início não pode ficar em branco')
    expect(page).to have_content('Salário não pode ficar em branco')
    expect(page).to have_content('Salário não é um número')
    expect(page).to have_content('Benefícios não pode ficar em branco')
    expect(page).to have_content('Informações adicionais não pode ficar em branco')
    expect(page).to have_content('Expectativas não pode ficar em branco')
  end

  scenario 'valid date' do
    head = create(:head)
    job_vacancy = create(:job_vacancy, head: head)
    applicant = create(:applicant)
    create(:job_opening, job_vacancy: job_vacancy,
                                       applicant: applicant)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver detalhes'
    click_on 'Aceitar e enviar Proposta'
    fill_in 'Data de início', with: 1.day.ago
    fill_in 'Salário', with: '9001'
    fill_in 'Benefícios', with: 'Muitas coisas, tantas que eu não posso nem dizer'
    fill_in 'Informações adicionais', with: 'Pro atividade, Trabalho em grupo, desafiar limites'
    fill_in 'Expectativas', with: 'outras muitas coisas que acabam não acontecendo não sei'
    click_on 'Enviar'

    expect(page).to have_content('Data de início não pode ser anterior a hoje')
  end

  scenario 'already exists' do
    head = create(:head)
    job_vacancy = create(:job_vacancy, head: head)
    applicant = create(:applicant)
    job_opening = create(:job_opening, job_vacancy: job_vacancy,
                                       applicant: applicant)
    create(:job_offer, job_opening: job_opening)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver detalhes'
    click_on 'Aceitar e enviar Proposta'

    expect(current_path).to eq(job_vacancy_path(job_vacancy))
    expect(page).to have_content('Proposta já enviada')
  end
end
