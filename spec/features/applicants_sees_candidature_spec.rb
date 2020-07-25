# frozen_string_literal: true

require 'rails_helper'

feature 'Applicant applies for a job' do
  context 'selects a job' do
    scenario 'sucessfully' do
      user = create(:user)
      create(:applicant, user: user)
      create(:job_vacancy)
      create(:job_opening)

      login_as user, scope: :user

      visit root_path
      click_on 'Minhas Vagas'
      expect(page).to have_link('Minhas Vagas')
    end
  end
end
