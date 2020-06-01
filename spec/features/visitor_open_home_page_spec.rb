require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Headhunters Recrutamento')
    expect(page).to have_content('Seja bem vindo')
  end
end

