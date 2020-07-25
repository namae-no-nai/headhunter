# frozen_string_literal: true

require 'rails_helper'

feature 'Head favorites applicant' do
  scenario 'sucessfully' do
    head = create(:head)
    applicant = create(:applicant)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver perfis cadastrados'
    click_on 'Mago'
    click_on 'Favoritar candidato'

    expect(page).to have_content('Candidato destacado')
    expect(page).to have_content('⭐')
    expect(page).to have_content('Desfavoritar candidato')
  end
  scenario 'desfav' do
    head = create(:head)
    applicant = create(:applicant)
    favorite = create(:favorite, applicant: applicant, head: head)
    login_as head, scope: :head

    visit root_path
    click_on 'Ver perfis cadastrados'
    click_on 'Mago'
    click_on 'Desfavoritar candidato'

    expect(page).to have_content('Candidato não é mais destacado')
    expect(page).not_to have_content('⭐')
    expect(page).to have_content('Favoritar candidato')
  end
end
