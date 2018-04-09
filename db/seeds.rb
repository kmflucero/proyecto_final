# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#AdminUser.create!(email: 'admin2@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

10.times do |i|
User.create(
  name: Faker::Name.name,
  email: "email#{i}@mail.com",
  password: "12345678",
  address: "Manutara 8994, La Florida, Región Metropolitana"
)
end

5.times do |i|
 Category .create(
   name: "Categoria #{i}"
 )
end

50.times do |i|
 Product.create(
   name: Faker::Commerce.product_name,
   price: Faker::Commerce.price.to_i,
   photo: "https://picsum.photos/400/200?image=#{i + 1}",
   description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt",
   category: Category.order("RANDOM()").first,
   top: false
 )
end

4.times do |i|
 Product.create(
   name: Faker::Commerce.product_name,
   price: Faker::Commerce.price.to_i,
   photo: "https://picsum.photos/400/200?image=#{i + 1}",
   description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt",
   category: Category.order("RANDOM()").first,
   top: true
 )
end

20.times do |i|
 Billing.create(
   code: 1000 + i,
   payment_method: "paypal",
   created_at: Faker::Date.between(10.days.ago, Date.today),

 )
end

20.times do |i|
 Order.create(
   user: User.order("RANDOM()").first,
   product: Product.order("RANDOM()").first,
   price: Faker::Commerce.price.to_i,
   created_at: Faker::Date.between(10.days.ago, Date.today),
   billing: Billing.order("RANDOM()").first
 )
end



