FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    quantity { 1 }
    price { 1.5 }
  end
end
