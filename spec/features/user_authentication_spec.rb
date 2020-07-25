# frozen_string_literal: true

require 'rails_helper'

feature 'User auth' do
  context 'log in' do
    scenario 'sucessfully' do
      user = create(:user)
      create(:applicant, user: user)

      visit root_path
      click_on 'Candidato'
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end
end
