FactoryBot.define do
  factory :example do
    association :tlanslation 
    english { "MyText" }
    japanese { "MyText" }
  end
end
