FactoryBot.define do
  factory :comment do
    content     { Faker::Lorem.sentence }
    association :user
    association :restaurant
  end
end
