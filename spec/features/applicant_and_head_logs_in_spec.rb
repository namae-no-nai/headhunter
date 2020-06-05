require 'rails_helper'

feature 'User sees profile' do
  scenario 'sucessfully' do
    user = create(:user)
    head = create(:head)
    applicant = create(:applicant, user:user)

    login_as user, scope: :user

    visit @applicant

    login_as head, scope: :head

    expect(current_path).to eq(root_path)
  end
end
