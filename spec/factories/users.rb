# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Franek' }
    last_name  { 'Frankowski' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'Abcd1234' }
    password_confirmation { 'Abcd1234' }
  end
end
