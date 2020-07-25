# frozen_string_literal: true

require 'rails_helper'

feature 'Applicant sees candidatures' do
  scenario 'sucessfully' do
    user = create(:user)
    applicant = create(:applicant, user: user)
    job_vacancy = create(:job_vacancy)
    create(:job_opening, job_vacancy: job_vacancy,
                         applicant: applicant)

    login_as user, scope: :user

    visit root_path
    click_on 'Minhas Vagas'

    expect(page).to have_content('Mago')
    expect(page).to have_content('R$1000,00 a R$2000,00')
    expect(page).to have_content('pleno')
    expect(page).to have_content('A')
    expect(page).to have_content('Em Espera')
  end
  scenario 'no candidatures' do
    user = create(:user)
    create(:applicant, user: user)

    login_as user, scope: :user

    visit root_path
    click_on 'Minhas Vagas'

    expect(page).to have_content('Nenhuma candidatura registrada')
  end
  scenario 'see details' do
    user = create(:user)
    applicant = create(:applicant, user: user)
    job_vacancy = create(:job_vacancy)
    create(:job_opening, job_vacancy: job_vacancy,
                         applicant: applicant)

    login_as user, scope: :user

    visit root_path
    click_on 'Minhas Vagas'
    click_on 'Detalhes da Vaga'
    click_on 'Ver minha candidatura'

    expect(page).to have_content('Mago')
    expect(page).to have_content('MyString')
    expect(page).to have_content(I18n.l(Time.now, format: :short).to_s)
    expect(page).to have_content('Em Espera')
  end
end
