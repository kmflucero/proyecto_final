# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


addresses = "289 Constitution Court
Liverpool, NY 13090
8248 Buttonwood Drive
Herndon, VA 20170
953 Lake View Lane
Greensburg, PA 15601
8489 Smith Store Street
Wake Forest, NC 27587
60 Pumpkin Hill Dr.
South Ozone Park, NY 11420
923 Wakehurst Lane
New Orleans, LA 70115
995 Lakewood Court
Upland, CA 91784
"
Store.destroy_all
addresses = addresses.split("\n")
addresses.each do |address|
 Store.create!(name: Faker::Name.name, address: address)
 sleep 1
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Product.destroy_all
50.times do |i|
	Product.create(
		name: Faker::Commerce.product_name,
		price: Faker::Commerce. price.to_i,
		photo: "https://picsum.photos/400/200?image=#{i + 1}",
		description: "Loreem ipsum dolor  blablaba"
		)
end
Order.destroy_all
15.times do |i|
	Order.create(
		)
end