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
surfshark = Company.create(name: "Surfshark")
notion = Company.create(name: "Notion")
one_pass = Company.create(name: "One Pass")
hello_fresh = Company.create(name: "Hello Fresh")

puts "Seeding subscriptions... "
netflix_sub = Subscription.create(user: ellie, company: netflix, status: true, frequency: 1, billing: "monthly", pricing: 11.99)
spotify_sub = Subscription.create(user: ellie, company: spotify, status: true, frequency: 1, billing: "weekly", pricing: 10.99)

puts "Seeding subscription payments... "
# month_in_s = 4 * 7 * 24 * 60 * 60
# week_in_s = 7 * 24 * 60 * 60
netflix_payment_1 = SubscriptionPayment.create(subscription: netflix_sub, next_payment_date: Time.now, paid: false)
spotify_payment_1 = SubscriptionPayment.create(subscription: spotify_sub, next_payment_date: Time.now, paid: false)

puts "Seeding categories... "
cat_entertainment = Category.create(title: "Entertainment")
cat_music = Category.create(title: "Music")

puts "Seeding subscription categories... "
sub_cat_1 = SubscriptionCategory.create(subscription: netflix_sub, category: cat_entertainment)
sub_cat_2 = SubscriptionCategory.create(subscription: spotify_sub, category: cat_music)

puts "🎄 End of seeding... 🎄"
