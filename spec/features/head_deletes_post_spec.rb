# frozen_string_literal: true

require 'rails_helper'

feature 'Head deletes a comment' do
  scenario 'sucessfully' do
    head = create(:head)
    applicant = create(:applicant)
    create(:post, applicant: applicant, head: head)

    login_as head, scope: :head

    visit root_path
    click_on 'Ver perfis cadastrados'
    click_on 'Mago'
    expect(page).to have_content('Um post')
    click_on 'Deletar'

    expect(page).not_to have_content('Um post')
  end
end
