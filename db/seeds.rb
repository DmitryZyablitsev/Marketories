User.destroy_all

user = User.create!(email: 'user@develop.com')

5.times do
  user.products.create!(
    { title: FFaker::Product.product_name, price: rand(100..1000),
      description: FFaker::Lorem.sentence(10), specification: FFaker::Lorem.sentence(5) }
  )
end
