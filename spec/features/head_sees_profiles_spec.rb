# frozen_string_literal: true

require 'rails_helper'

feature 'Head sees all profiles' do
  scenario 'sucessfully' do
    head = create(:head)
    create(:applicant)

    login_as head, scope: :head
    visit root_path
    click_on 'Ver perfis cadastrados'

    expect(page).to have_content('Mago')
    expect(page).to have_content('Ensino Superior')
    expect(page).to have_content('11/11/1991')
  end
end
