# frozen_string_literal: true

require 'rails_helper'

feature 'head sees applicants for vacancies' do
  scenario 'any applicants' do
    head = create(:head)
    job_vacancy = create(:job_vacancy, head: head)
    create(:job_opening, job_vacancy: job_vacancy)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver detalhes'
    expect(page).to have_content('Mago')
    expect(page).to have_content('Ensino Superior')
    expect(page).to have_content('MyString')
    expect(page).to have_content('Em Espera')
  end
end
