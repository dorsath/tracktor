FactoryGirl.define do
  factory :project do
    name {Faker::Name.name }
  end

  factory :sprint do
    name {Faker::Name.name }
    active true
  end

  factory :issue do
    name {Faker::Name.name }
  end

  factory :user do
    email {Faker::Internet.email }
    password "welkom123"
  end
end
