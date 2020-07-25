# frozen_string_literal: true

require 'rails_helper'

feature 'User sees proposals' do
  scenario 'sucessfully' do
    user = create(:user)
    applicant = create(:applicant, user: user)
    job_opening = create(:job_opening, applicant: applicant)
    create(:job_offer, job_opening: job_opening)

    login_as user, scope: :user
    visit root_path
    click_on 'Minhas Propostas'

    expect(current_path).to eq(job_offers_path)
    expect(page).to have_content('Mago')
    expect(page).to have_content('Ser implacável')
    expect(page).to have_content(I18n.l(Time.zone.today + 3.days).to_s)
    expect(page).to have_content('R$ 9.001,00')
    expect(page).to have_content('Muitas coisas, tantas que eu não posso nem dizer')
    expect(page).to have_content('Pro atividade, Trabalho em grupo, desafiar limites')
    expect(page).to have_content('outras muitas coisas que acabam não acontecendo não sei')
  end
  scenario 'no feedbacks' do
    user = create(:user)
    applicant = create(:applicant, user: user)
    create(:job_opening, applicant: applicant)

    login_as user, scope: :user
    visit root_path
    click_on 'Minhas Propostas'

    expect(current_path).to eq(job_offers_path)
    expect(page).to have_content('Nenhuma proposta')
  end
end
