# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "🥵 Start of mass destruction... 🥵"
User.destroy_all
Company.destroy_all
puts "🥵 End of destruction... 🥵"
puts "🌱 Start seeding... 🌱"
ellie = User.create(username: "Ellie", email: "ellie@gmail.com", password:"123", password_confirmation:"123")
Profile.create(user: ellie, first_name: "Ellie", last_name: "Williams")

puts "Seeding companies... "
netflix = Company.create(name: "Netflix")
spotify = Company.create(name: "Spotify")

puts "Seeding subscriptions... "
netflix_sub = Subscription.create(user: ellie, company: netflix, status: true, frequency: 1, billing: "monthly", pricing: 11.99, start_date: Time.now)

puts "🎄 End of seeding... 🎄"
