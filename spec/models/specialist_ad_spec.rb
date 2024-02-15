require 'rails_helper'

RSpec.describe SpecialistAd, type: :model do
  # Test associations
  it { should belong_to(:user) }

  # Test validations
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5).is_at_most(100) }

  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(10) }

  it { should validate_numericality_of(:desired_salary).is_greater_than_or_equal_to(0).only_integer.allow_nil }

  it { should allow_value('', nil).for(:portfolio_url) }
  it { should allow_value('http://example.com', 'https://example.com').for(:portfolio_url) }
  it { should_not allow_value('invalid_url', 'ftp://example.com').for(:portfolio_url) }

  # Test FactoryBot factory
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:specialist_ad)).to be_valid
    end
  end
end
