# frozen_string_literal: true

require 'rails_helper'

feature 'Head searchs for job vacancy' do
  scenario 'sucessfully' do
    head = create(:head)
    create(:job_vacancy)
    login_as head, scope: :head
    visit root_path
    click_on 'Ver vagas de emprego'
    fill_in 'Busca', with: 'Mago'
    click_on 'Buscar'

    expect(page).to have_content('Mago')
    expect(page).to have_content('Ser implacável')
  end
end
