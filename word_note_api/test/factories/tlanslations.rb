FactoryBot.define do
  factory :tlanslation do
    association :word
    japanese { "MyText" }
  end
end
