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


Item.create!(title: 'Half eaten sandwich', description: 'Half eaten BLT sandwich from yesterday. This sandwich really was very tasty but I asked the restaurant to leave out the tomatoes and they sent it with the tomatoes anyway. I did not want to throw away the sandwich because I only had one bite.', price: 5, user: charlotte, address:'Ralbag St 15, Tel Aviv-Yafo')
Item.create(title: 'Old Harry Potter Book', description: 'I ripped out a few chapters because I wanted to read this book on vacation but the whole book did not fit in my carry on. The book is still readble though and I am sure you can find the other chapters somewhere online too.', price: 10, user: charlotte, address:'Olei Zion St, Tel Aviv-Yafo')
Item.create(title: 'iPhone 4s', description: 'The phone does not turn on but you can use it as a mirror. I also have a cool case that comes with the phone as well. I bought the iPhone X So I do not really need this one anymore.', price: 30, user: charlotte, address:'Dizengoff St 275, Tel Aviv-Yafo')
Item.create(title: 'Used water bottle', description: 'I do not where to go to recycle this bottle. I drank most of it but there are still a few sips left', price: 30, user: charlotte, address:'Dizengoff St 223, Tel Aviv-Yafo')

Item.create(title: 'Half a cup of coffee', description: 'I went to sleep at 5 am and then made this coffee at work. I must have been really tired because I accidentally put salt in the coffee instead of sugar. I had a couple of sips and could not finish it.', price: 1, user: talia, address:'Haroe 82, Ramat Gan')
Item.create(title: 'Dead house plant', description: 'I went on vacation for a couple of weeks and my little brother forgot to water it while I was away. The pot is really pretty though!.', price: 15, user: talia, address:"Sirkin St 7, Giv'atayim")
Item.create(title: 'Vintage watch (broken)', description: 'The watch is stuck and it always says that the time is 3 pm. It is a nice watch and I always get tons of compliments on it. It matches every outfit!', price: 20, user: talia, address:'Berkovitch St 4, Tel Aviv-Yafo')
Item.create(title: 'Broken bag', description: 'The zipper is broken so it does not close and all of my things are always falling out. If you know how to sew you might be able to fix it.', price: 20, user: talia, address:'HaHashmonaim St 103, Tel Aviv-Yafo, 67133')

Item.create(title: 'A second hand dog', description: 'Pees on everything but otherwise very cute. He is a lot of responsibility but he is fun to play with!', price: 5000, user: angel, address:'Lilienblum St 40, Tel Aviv-Yafo')
Item.create(title: 'New York Times 1997', description: 'I found this newspaper when I was doing some spring cleaning. this issue is a bit outdated but a still great read.', price: 100, user: angel, address:'Rothschild Blvd 22, Tel Aviv-Yafo, 6688218')
Item.create(title: 'Used whiteboard', description: 'I wrote a bunch of stuff on the board and left it for a month. I am too lazy to buy whiteboard cleaner to erase it all. Comes with a free marker', price: 22, user: angel, address:'Ahuzat Bayit St 4, Tel Aviv-Yafo, 6688119')
Item.create(title: 'Broken headphones', description: 'The left earbud does not work and I just bought new AirPods', price: 22, user: angel, address:'Shabazi St 9, Tel Aviv-Yafo')

puts "you have #{User.count} users & #{Item.count} items"

