# frozen_string_literal: true

require 'rails_helper'

feature 'User creates account' do
  context 'log in' do
    scenario 'sucessfully' do
      visit root_path
      click_on 'Candidato'
      click_on 'Criar conta'
      fill_in 'Email', with: 'teste@teste.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmar senha', with: '123456'

      click_button 'Criar conta'

      expect(page).to have_content('Nome completo')
      expect(page).to have_content('Nome social')
      expect(page).to have_content('Data de nascimento')
      expect(page).to have_content('Formação')
      expect(page).to have_content('Descrição')
      expect(page).to have_content('Experiência Profissional')
      expect(page).to have_content('Foto')
      expect(page).to have_button('Enviar')
      expect(current_path).to eq(new_applicant_path)
    end
  end
end
