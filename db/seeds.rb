# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "🥵 Start of mass destruction... 🥵"
User.destroy_all
puts "🥵 End of destruction... 🥵"
puts "🌱 Start seeding... 🌱"
ellie = User.create(username: "Ellie", email: "ellie@gmail.com", password:"123", password_confirmation:"123")
Profile.create(user: ellie, first_name: "Ellie", last_name: "Williams")
puts "🎄 End of seeding... 🎄"
