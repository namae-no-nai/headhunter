require 'rails_helper'

feature 'Head posts a comment' do
  scenario 'sucessfully' do
    head = create(:head)
    applicant = create(:applicant)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver perfis cadastrados'
    click_on 'Mago'
    click_on 'Deixar Comentário'
    fill_in 'Comentário', with: 'qualquer coisa que eu quiser'
    click_on 'Enviar'

    expect(page).to have_content('qualquer coisa que eu quiser')
  end
end
