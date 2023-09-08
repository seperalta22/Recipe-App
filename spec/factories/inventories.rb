FactoryBot.define do
  factory :inventory do
    name { Faker::Lorem.word }
    association :user
  end
end
