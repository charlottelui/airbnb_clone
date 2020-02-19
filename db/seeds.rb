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
Booking.destroy_all

puts 'creating users'

charlotte = User.create!(first_name: 'Charlotte', email: 'charlotte@charlotte.com', password: '123456')
talia = User.create!(first_name: 'Talia', email: 'talia@talia.com', password: '123456')
angel = User.create!(first_name: 'Angel', email: 'angel@angel.com', password: '123456')

puts 'creating items'

Item.create!(title: 'Half eaten sandwich', description: 'Half eaten BLT sandwich from yesterday. This sandwich really was very tasty but I asked the restaurant to leave out the tomatoes and they sent it with the tomatoes anyway. I did not want to throw away the sandwich because I only had one bite.', price: 5, user: charlotte)
Item.create(title: 'Harry Potter and the Chamber of Secrets', description: 'I ripped out a few chapters because I wanted to read this book on vacation but the whole book did not fit in my carry on. The book is still readble though and I am sure you can find the other chapters somewhere online too.', price: 10, user: charlotte)
Item.create(title: 'iPhone 4s', description: 'The phone does not turn on but you can use it as a mirror. I also have a cool case that comes with the phone as well. I bought the iPhone X So I do not really need this one anymore.', price: 30, user: charlotte)

Item.create(title: 'Half a cup of coffee', description: 'I went to sleep at 5 am and then made this coffee at work. I must have been really tired because I accidentally put salt in the coffee instead of sugar. I had a couple of sips and could not finish it.', price: 1, user: talia)
Item.create(title: 'Dead house plant', description: 'I went on vacation for a couple of weeks and my little brother forgot to water it while I was away. The pot is really pretty though!.', price: 15, user: talia)
Item.create(title: 'Broken watch', description: 'The watch is stuck and it always says that the time is 3 pm. It is a nice watch and I always get tons of compliments on it. It matches every outfit!', price: 20, user: talia)

Item.create(title: 'Gucci', description: 'Pees on everything but otherwise very cute. He is a lot of responsibility but he is fun to play with!', price: 5000, user: angel)
Item.create(title: 'New York Times 1997', description: 'A bit outdated but a great read.', price: 100, user: angel)
Item.create(title: 'whiteboard', description: 'I am too lazy to buy whiteboard cleaner. Comes with a free marker', price: 22, user: angel)

puts "you have #{User.count} users & #{Item.count} items"

