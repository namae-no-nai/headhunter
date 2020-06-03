require 'rails_helper'

feature 'Head creates job vacancy' do
  scenario 'sucessfully' do
    head = create(:head)

    login_as head, scope: :head

    visit root_path
    click_on 'Cadastrar vaga de emprego'
    expect(current_path).to eq(new_job_vacancy_path)

    fill_in 'Vaga', with: 'Desenvolvedor pleno'
    fill_in 'Descrição da vaga', with: 'uma descrição qualquer de qualquer coisa'
    fill_in 'Habilidades desejáveis', with: 'dolore magna aliqua. Ut enim ad.'
    select 'R$1000,00 a R$2000,00', from: 'Faixa salarial'
    select 'pleno', from: 'Nível da vaga'
    fill_in 'Data limite', with: '18/10/2200'
    fill_in 'Localização da vaga', with: 'Moema'

    click_on 'Enviar'

    expect(page).to have_content('Desenvolvedor pleno')
    expect(page).to have_content('uma descrição qualquer de qualquer coisa')
    expect(page).to have_content('dolore magna aliqua. Ut enim ad.')
    expect(page).to have_content('R$1000,00 a R$2000,00')
    expect(page).to have_content('pleno')
    expect(page).to have_content('18/10/2200')
    expect(page).to have_content('Moema')
    expect(page).to have_link('Voltar')

    click_on 'Voltar'
    expect(current_path).to eq(root_path)
  end
  scenario 'cannot be blank' do
    head = create(:head)

    login_as head, scope: :head

    visit root_path
    click_on 'Cadastrar vaga de emprego'
    expect(current_path).to eq(new_job_vacancy_path)

    fill_in 'Vaga', with: ''
    fill_in 'Descrição da vaga', with: ''
    fill_in 'Habilidades desejáveis', with: ''
    select 'R$1000,00 a R$2000,00', from: 'Faixa salarial'
    select 'pleno', from: 'Nível da vaga'
    fill_in 'Data limite', with: ''
    fill_in 'Localização da vaga', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Vaga não pode ficar em branco')
    expect(page).to have_content('Descrição da vaga não pode ficar em branco')
    expect(page).to have_content('Habilidades desejáveis não pode ficar em branco')
    expect(page).to have_content('Data limite não pode ficar em branco')
    expect(page).to have_content('Localização da vaga não pode ficar em branco')
  end

  scenario 'date before today' do
    head = create(:head)

    login_as head, scope: :head

    visit root_path
    click_on 'Cadastrar vaga de emprego'
    expect(current_path).to eq(new_job_vacancy_path)

    fill_in 'Vaga', with: 'Desenvolvedor pleno'
    fill_in 'Descrição da vaga', with: 'uma descrição qualquer de qualquer coisa'
    fill_in 'Habilidades desejáveis', with: 'dolore magna aliqua. Ut enim ad.'
    select 'R$1000,00 a R$2000,00', from: 'Faixa salarial'
    select 'pleno', from: 'Nível da vaga'
    fill_in 'Data limite', with: 1.day.ago
    fill_in 'Localização da vaga', with: 'Moema'

    click_on 'Enviar'

    expect(page).to have_content('Data limite não pode ser anterior a hoje') 
  end
end