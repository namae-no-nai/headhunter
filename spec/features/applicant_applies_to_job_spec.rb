require 'rails_helper'

feature 'Applicant applies for a job' do
  context 'selects a job' do
    scenario 'sucessfully' do
      user = create(:user)
      applicant = create(:applicant, user: user)
      job_vacancy = create(:job_vacancy)

      login_as user, scope: :user

      visit root_path
      click_on 'Ver vagas de emprego'
      click_on 'Ver detalhes'
      click_on 'Me candidatar'
      fill_in 'Motivação', with: 'Me manter vivo'
      click_on 'Enviar'
      
      expect(page).to have_content('Mago')
      expect(page).to have_content('Ser implacável')
      expect(page).to have_content('magia')
      expect(page).to have_content('R$1000,00 a R$2000,00')
      expect(page).to have_content('pleno')
      expect(page).to have_link('Ver minha candidatura')
    end
    scenario 'cannot be blank' do
      user = create(:user)
      applicant = create(:applicant, user: user)
      job_vacancy = create(:job_vacancy)

      login_as user, scope: :user

      visit root_path
      click_on 'Ver vagas de emprego'
      click_on 'Ver detalhes'
      click_on 'Me candidatar'
      fill_in 'Motivação', with: ''
      click_on 'Enviar'

      expect(page).to have_content('Motivação não pode ficar em branco')
    end
  end
end