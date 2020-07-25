# frozen_string_literal: true

require 'rails_helper'

feature 'User sees Feedbacks' do
  scenario 'sucessfully' do
    user = create(:user)
    applicant = create(:applicant, user: user)
    job_opening = create(:job_opening, applicant: applicant)
    create(:feedback, job_opening: job_opening)

    login_as user, scope: :user
    visit root_path
    click_on 'Meus Feedbacks'

    expect(current_path).to eq(feedbacks_path)
    expect(page).to have_content('Mago')
    expect(page).to have_content('Ser implacável')
    expect(page).to have_content('infelizmente não foi dessa vez')
  end
  scenario 'no feedbacks' do
    user = create(:user)
    applicant = create(:applicant, user: user)
    create(:job_opening, applicant: applicant)

    login_as user, scope: :user
    visit root_path
    click_on 'Meus Feedbacks'

    expect(current_path).to eq(feedbacks_path)
    expect(page).to have_content('Nenhum feedback')
  end
end
