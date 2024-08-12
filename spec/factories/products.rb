FactoryBot.define do
  factory :product do
    user
    title { 'Sneakers' }
    description { 'Description-Sneakers' }
    specification { 'Specification-Sneakers' }
    price { 900 }

    trait :shirt do
      title { 'Shirt' }
      description { 'Description-Shirt' }
      specification { 'Specification-Shirt' }
      price { 780 }
    end
  end
end
