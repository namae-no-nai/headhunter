# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context '#message' do
    context 'create successfully' do
      it 'return message to apply job' do
        feedback = create(:feedback, message: 'Interessamos do seu perfil')

        expect(feedback.message).to eq 'Interessamos do seu perfil'

        expect(feedback).to be_valid
      end
    end

    context 'can be blank' do
      let(:feedback) { build(:feedback, message: '') }

      it 'and can not be valid' do
        expect(feedback).to_not be_valid
      end
    end

    context 'can not be bigger than 500 caracters' do
      let(:feedback) { build(:feedback, message: SecureRandom.base64(500)) }

      it 'and can not be valid' do
        expect(feedback).to_not be_valid
      end
    end
  end
end
