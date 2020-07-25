# frozen_string_literal: true

require 'rails_helper'

feature 'Applicant fills in form' do
  scenario 'sucessfully' do
    user = create(:user)

    login_as user, scope: :user

    visit root_path
    expect(current_path).to eq(new_applicant_path)
    fill_in 'Nome completo', with: 'Meu nome completo'
    fill_in 'Nome social', with: 'Meu nome provavelmente'
    fill_in 'Data de nascimento', with: '11/11/1991'
    fill_in 'Formação', with: 'Ensino Superior'
    fill_in 'Descrição', with: 'Área de ensino em 5 anos'
    fill_in 'Experiência Profissional', with: 'X anos'
    attach_file('Foto', 'app/assets/images/download.jpeg')

    click_on 'Enviar'

    expect(page).to have_content('Meu nome completo')
    expect(page).to have_content('Meu nome provavelmente')
    expect(page).to have_content('11/11/1991')
    expect(page).to have_content('Ensino Superior')
    expect(page).to have_content('Área de ensino em 5 anos')
    expect(page).to have_content('X anos')
    expect(page).to have_css('#photo')
    expect(page).to have_link('Editar')
  end
end
