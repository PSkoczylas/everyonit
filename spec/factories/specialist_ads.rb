FactoryBot.define do
  factory :specialist_ad do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    desired_salary { Faker::Number.number(digits: 5) }
    portfolio_url { Faker::Internet.url }
    user
  end
end
