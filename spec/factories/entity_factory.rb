FactoryGirl.define do
  factory :entity do
    category { ["Product", "Article", "Widget"].sample }
    identifier { Faker::Number.number(4) }
  end

  factory :entity_with_tags, parent: :entity do
    before(:create) do |entity, evaluator|
      random_tags = ["Corgi", "Purple", "Lemur", "Rhino", "Filed"]
      entity.tag_list.add random_tags.sample(3)
    end
  end
end
