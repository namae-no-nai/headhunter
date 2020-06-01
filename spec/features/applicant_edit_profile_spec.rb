require 'rails_helper'

feature 'Applicant edits profile' do
  before :each do
    user = create(:user)
    login_as user, scope: :user

    applicant = create(:applicant, user: user)

    visit root_path
    click_on 'Editar'
  end

  scenario 'successfully' do
    fill_in 'Nome completo', with: 'Giorno Giovana'
    fill_in 'Nome social', with: 'nome provavelmente'
    fill_in 'Data de nascimento', with: '11/11/1997'
    fill_in 'Formação', with: 'Ensino médio'
    fill_in 'Descrição', with: 'Área de ensino em 3 anos'
    fill_in 'Experiência Profissional', with: 'y anos'
    click_on 'Enviar'

    expect(page).to have_content('Giorno Giovana')
    expect(page).to have_content('nome provavelmente')
    expect(page).to have_content('11/11/1997')
    expect(page).to have_content('Ensino médio')
    expect(page).to have_content('Área de ensino em 3 anos')
    expect(page).to have_content('y anos')
  end

  scenario 'and cannot be blank' do
    fill_in 'Nome completo', with: ''
    fill_in 'Nome social', with: ''
    fill_in 'Data de nascimento', with: ''
    fill_in 'Formação', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Experiência Profissional', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome completo não pode ficar em branco')
    expect(page).to have_content('Nome Social não pode ficar em branco')
    expect(page).to have_content('Formação não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Experiência profissional não pode ficar em branco')
    expect(page).to have_content('Data de Nascimento não pode ficar em branco')
  end

  scenario 'must be sixteen' do
    fill_in 'Data de nascimento', with: 15.years.ago
    click_on 'Enviar'
    expect(page).to have_content('Data de Nascimento não pode ser menos que 16 anos')
  end
end
