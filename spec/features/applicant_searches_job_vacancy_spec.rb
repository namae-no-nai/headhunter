# frozen_string_literal: true

require 'rails_helper'

feature 'Applicant searchs for job vacancy' do
  scenario 'sucessfully' do
    user = create(:user)
    create(:job_vacancy)
    create(:applicant, user: user)
    login_as user, scope: :user
    visit root_path
    click_on 'Ver vagas de emprego'
    fill_in 'Busca', with: 'Mago'
    click_on 'Buscar'

    expect(page).to have_content('Mago')
    expect(page).to have_content('Ser implacável')
  end
end
