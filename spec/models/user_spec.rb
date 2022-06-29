# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { build(:user) }

  describe 'when user is valid' do
    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      expect validate_presence_of(:first_name)
      expect validate_presence_of(:last_name)
    end

    it 'is not valid without an email and a password' do
      expect validate_presence_of(:email)
      expect validate_presence_of(:encrypted_password)
    end
  end
end
