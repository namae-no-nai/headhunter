# frozen_string_literal: true

require 'rails_helper'

feature 'Head sees answers proposals' do
  scenario 'sucessfully' do
    head = create(:head)
    user = create(:user)
    applicant = create(:applicant, user: user)
    job_opening = create(:job_opening, applicant: applicant)
    job_offer = create(:job_offer, job_opening: job_opening, head: head)
    create(:reply_offer, job_offer: job_offer)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver Propostas respondidas'

    expect(current_path).to eq(reply_offers_path)
    expect(page).to have_content('Mago')
    expect(page).to have_content('Ser implacável')
    expect(page).to have_content(I18n.l(Time.zone.today + 3.days).to_s)
    expect(page).to have_content('R$ 9.001,00')
    expect(page).to have_content('Muitas coisas, tantas que eu não posso nem dizer')
    expect(page).to have_content('Pro atividade, Trabalho em grupo, desafiar limites')
    expect(page).to have_content('outras muitas coisas que acabam não acontecendo não sei')
    expect(page).to have_content('Aceito')
    expect(page).to have_content('Obrigado pela oportunidade')
  end
  scenario 'sucessfully' do
    head = create(:head)
    user = create(:user)
    applicant = create(:applicant, user: user)
    job_opening = create(:job_opening, applicant: applicant)
    create(:job_offer, job_opening: job_opening, head: head)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver Propostas respondidas'

    expect(current_path).to eq(reply_offers_path)
    expect(page).to have_content('Nenhuma proposta respondida')
  end
end
