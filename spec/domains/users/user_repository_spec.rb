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

  describe '#find_active_users' do
    context 'when there are active users' do
      let!(:active_user1) { create(:user, open_for_job: 2, is_anonymous: false) }
      let!(:active_user2) { create(:user, open_for_job: 2, is_anonymous: false) }
      let!(:inactive_user) { create(:user, open_for_job: 1, is_anonymous: false) }
      let!(:anonymous_user) { create(:user, open_for_job: 2, is_anonymous: true) }

      it 'returns active users who are not anonymous' do
        active_users = subject.find_active_users

        expect(active_users).to include(active_user1, active_user2)
        expect(active_users).not_to include(inactive_user, anonymous_user)
      end
    end

    context 'when there are no active users' do
      let!(:inactive_user1) { create(:user, open_for_job: 1, is_anonymous: false) }
      let!(:inactive_user2) { create(:user, open_for_job: 1, is_anonymous: false) }

      it 'returns an empty array' do
        active_users = subject.find_active_users

        expect(active_users).to be_empty
      end
    end
  end
end
