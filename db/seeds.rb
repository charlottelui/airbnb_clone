# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning data base"
User.destroy_all
Item.destroy_all

puts 'creating users'

User.create(first_name: 'Charlotte', email: 'charlotte@charlotte.com', password: '123456')
User.create(first_name: 'Talia', email: 'talia@talia.com', password: '123456')
User.create(first_name: 'Angel', email: 'angel@angel.com', password: '123456')

puts 'creating items'

Item.create(title: 'Sandwich', description: 'Half eaten BLT sandwich from yesterday', price: 5, user_id: 1)
Item.create(title: 'Harry Potter vol. 3', description: 'Ripped out a few pages in chapter 6 but still readable', price: 10, user_id: 1)
Item.create(title: 'iPhone 4s', description: 'The phone does not turn on but you can use it as a mirror', price: 30, user_id: 1)

Item.create(title: 'coffee', description: 'tons of caffeine to get you through the day. Just too much milk', price: 1, user_id: 2)
Item.create(title: 'House plant', description: 'forgot to water it for a few weeks but the pot is so pretty', price: 15, user_id: 2)
Item.create(title: 'watch', description: 'always says it is 3 pm', price: 20, user_id: 2)

Item.create(title: 'Gucci', description: 'Pees on everything but otherwise very cute', price: 5000, user_id: 3)
Item.create(title: 'New York Times 1997', description: 'A bit outdated but a great read', price: 100, user_id: 3)
Item.create(title: 'whiteboard', description: 'I am too lazy to buy whiteboard cleaner. Comes with a free marker', price: 22, user_id: 3)

puts "you have #{User.count} users & #{Item.count} items"

