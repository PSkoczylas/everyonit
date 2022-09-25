# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Franek' }
    last_name  { 'Frankowski' }
    email { 'franek@franek.com' }
    password { 'Abcd1234' }
    password_confirmation { 'Abcd1234' }
  end
end
