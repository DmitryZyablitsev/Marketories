User.destroy_all

admin, user = User.create!([
                             { email: 'admin@develop.com', password: '12345678', password_confirmation: '12345678',
                               confirmed_at: Time.now, role: 2 },
                             { email: 'user@develop.com', password: '12345678', password_confirmation: '12345678',
                               confirmed_at: Time.now }
                           ])

5.times do
  admin.products.create!(
    { title: FFaker::Product.product_name, price: rand(100..1000),
      description: FFaker::Lorem.sentence(10), specification: FFaker::Lorem.sentence(5) }
  )
  user.products.create!(
    { title: FFaker::Product.product_name, price: rand(100..1000),
      description: FFaker::Lorem.sentence(10), specification: FFaker::Lorem.sentence(5) }
  )
end
