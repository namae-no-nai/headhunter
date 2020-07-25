require 'rails_helper'

feature 'User sees proposals' do
  scenario 'sucessfully' do
    head = create(:head)
    user = create(:user)
    applicant = create(:applicant, user:user)
    job_opening = create(:job_opening, applicant:applicant)
    job_offer = create(:job_offer, job_opening: job_opening, head: head)
  
    login_as user, scope: :user
    visit root_path
    click_on 'Minhas Propostas'
    click_on 'Responder proposta'

    fill_in 'Mensagem', with: 'Estou feliz por ser contratado'
    select 'Aceito', from: 'Resposta'
    click_on 'Enviar'

    expect(page).to have_content('Proposta enviada')
    expect(current_path).to eq(job_offers_path)
  end
  scenario 'already sent' do
    head = create(:head)
    user = create(:user)
    applicant = create(:applicant, user:user)
    job_opening = create(:job_opening, applicant:applicant)
    job_offer = create(:job_offer, job_opening: job_opening, head: head)
    reply_offer = create(:reply_offer, job_offer: job_offer)
    login_as user, scope: :user
    visit root_path
    click_on 'Minhas Propostas'
    click_on 'Responder proposta'

    expect(current_path).to eq(job_offers_path)
    expect(page).to have_content('Proposta já enviada')
  end
end
    