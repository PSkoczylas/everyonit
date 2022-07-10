# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UserRepository do
  subject { Users::UserRepository }

  let!(:user1) { create(:user) }

  describe '#find_user' do
    context 'when user exist' do
      let(:id) { user1.id }

      it 'returns user' do
        expect(subject.find_user(id)).to eq(user1)
      end
    end

    context 'when user does not exist' do
      let(:id) { user1.id + 1 }

      it 'returns ActiveRecord::RecordNotFound exception' do
        expect { subject.find_user(id) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
