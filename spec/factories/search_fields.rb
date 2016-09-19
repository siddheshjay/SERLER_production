require 'faker'
FactoryGirl.define do
  factory :searches do |f|
    f.name{ Faker::Name.name }
    f.saved_on{ Date.today }
  end

  factory :search_field do |f|
    f.content{ Faker::Hipster.sentence }
    f.field{ Faker::Book.genre }
    f.op1{ Faker::Book.title }
    f.op2{ Faker::Book.author }
    association :search
  end
end