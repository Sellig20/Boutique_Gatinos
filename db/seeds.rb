# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |item|
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

  Item.create(title: Faker::FunnyName.two_word_name, description: Faker::Lorem.paragraph_by_chars(number: rand(6..100)), price: rand(1..100), image_url: "http://placekitten.com/g/300/200")
end

