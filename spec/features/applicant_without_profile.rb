# frozen_string_literal: true

require 'rails_helper'

features 'User without profile' do
  scenrio 'visits ' do
    user = create(:user)
    login_as user, scope: :user

    visits root_path
    click_on 'Ver vagas de emprego'
    expect(current_path).to eq(new_applicant_path)
  end
  scenario 'visits ' do
    user = create(:user)
    login_as user, scope: :user

    visits root_path
    click_on 'Meus Feedbacks' 'Minhas Propostas' 'Minhas Vagas'
    expect(current_path).to eq(new_applicant_path)
  end
  scenario 'visits ' do
    user = create(:user)
    login_as user, scope: :user

    visits root_path
    click_on 'Minhas Propostas' 'Minhas Vagas'
    expect(current_path).to eq(new_applicant_path)
  end
  scenrio 'visits ' do
    user = create(:user)
    login_as user, scope: :user

    visits root_path
    click_on 'Minhas Vagas'
    expect(current_path).to eq(new_applicant_path)
  end
  scenario 'visits ' do
    user = create(:user)
    login_as user, scope: :user

    visits job_openings_path

    expect(current_path).to eq(new_applicant_path)
  end
end
