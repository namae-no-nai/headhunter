# frozen_string_literal: true

require 'rails_helper'

feature 'Head auth' do
  context 'log in' do
    scenario 'sucessfully' do
      head = create(:head)

      visit root_path
      click_on 'Headhunter'
      fill_in 'Email', with: head.email
      fill_in 'Senha', with: head.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end
end
