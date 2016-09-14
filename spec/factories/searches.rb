FactoryGirl.define do
  factory :search do |f|
    f.name {Faker::Name.name}
    f.saved_on {Faker::Date.forward(0)}
  end
end
