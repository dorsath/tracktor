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
    created_by { User.first || FactoryGirl.create(:user) }
  end

  factory :user do
    name { Faker::Name.name }
    email {Faker::Internet.email }
    password "welkom123"
  end
end
