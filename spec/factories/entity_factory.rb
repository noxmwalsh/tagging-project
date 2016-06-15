FactoryGirl.define do
  factory :entity do
    category { ["Product", "Article", "Widget"].sample }
    identifier { Faker::Number.number(4) }
  end
end
