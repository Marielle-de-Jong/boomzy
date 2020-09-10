
require 'faker'
require "open-uri"

CATEGORIES = %w(Crafts Woodworking Painting Music Writing Entrepreneurship Photography Drawing Gardening)
STATUS = %w(Pending Accepted Denied)
LEVELS = %w(Beginner Intermediate Advanced)

# Addresses for user. Not sure how Polymorphic assoc. affects these, if at all.
STREETS_ZIPS = [
  ["Westzaanstraat 10", "1013NG"],
  ["Willem Passtoorsstraat 104", "1073HX"],
  ["Rooseveltlaan 124", "1078NW"],
  ["Meteorensingel 156", "1033CC"],
  ["IJsbaanpad 9", "1076CV"],
  ["Korte Leidsedwarsstraat 111", "1017PX"],
  ["Prinsenstraat 22", "1015DD"],
  ["Lindengracht 75", "1015KD"],
  ["Plantage Kerklaan 61", "1018CX"],
  ["Javaplein 23", "1095CJ"]
]
# Addresses for booking location
MEETING_SZ = [
  ["Museumstraat 1", "1071XX"],
  ["Dam 20", "1012NP"],
  ["Nieuwezijds Voorburgwal 147", "1012RJ"],
  ["Museumplein 6", "1071DJ"],
  ["Kalverstraat 92", "1012PH"],
  ["Prinsengracht 279", "1016GW"],
  ["Dam 1", "1012JS"],
  ["Rokin 78", "1012KW"],
  ["Keizersgracht 609", "1017DS"],
  ["Prinsengracht 279a", "1016GW"]
]

ADMINS = [
  ["Marielle", "marielle@test.com"],
  ["Tommy", "tommy@test.com"],
  ["Will", "will@test.com"],
  ["Alex", "alex@test.com"]
]


puts "Start time = #{Time.now}"
puts "Emptying database"

Review.destroy_all
Booking.destroy_all
Listing.destroy_all
Skill.destroy_all
User.destroy_all


puts "----------------------------------------"
puts "[LOG] creating Thijs..."

user = User.new
user.first_name = "Thijs"
user.last_name = "van Oosten"
# Email should be first_name@boomzy.me
user.email = "thijs@boomzy.me"
# Password should be test123
user.password = 'test123'
user.password_confirmation = 'test123'
user.bio = "Thijs here. I've been a hobby glassblower for over 20 years. I have had so much fun and would now like to teach the next generation how to do this."
user.motivation = "I feel everyone should be able to put their creativity into something they like. Glassblowing is such a beautiful art and makes for beautiful presents."
file = URI.open("https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
user.save!

puts "----------------------------------------"
puts "[LOG] creating Thijs's address..."


Address.create(
    city: "Amsterdam",
    address_line_1: "Ferdinand Bolstraat 143",
    postcode: "1072LH",
    addressable: user,
    )

puts "----------------------------------------"
puts "[LOG] creating THIJS's first skill, listings and bookings..."


skill = Skill.create!(
    name: "Glassblowing",
    category: "Crafts",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Make a vase out of glass",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Intermediate",
    description: "Learn how to make a vase from glass",
    listing_image: "https://images.unsplash.com/photo-1593208946258-1940798d63cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Ferdinand Bolstraat 143",
    postcode: "1072LH",
    addressable: listing
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: STATUS.sample,
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] creating THIJS's first skill, listings and bookings..."


skill = Skill.create!(
    name: "Pattern making",
    category: "Crafts",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Advanced glassblowing",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "In this class you can make any object you like and will support you with your project. Make for example a beautiful vase or candle holder."
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Ferdinand Bolstraat 143",
    postcode: "1072LH",
    addressable: listing,
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Accepted",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] THIJS Completed ..."


puts "----------------------------------------"
puts "[LOG] creating BRIAN's first skill, listings and bookings..."


skill = Skill.create!(
    name: "Bike Maintenace",
    category: "Mechanics",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Fixing your bike",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "Bikes are the gateway to mechanics, I can teach you to change a tyre or realign your gears and everything in between."
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Westzaanstraat 10",
    postcode: "1013NG",
    addressable: listing,
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Accepted",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] BRIAN Completed ..."

puts "----------------------------------------"
puts "[LOG] creating SUSAN..."

user = User.new
user.first_name = "Susan"
user.last_name = "Feldmen"
# Email should be first_name@boomzy.me
user.email = "susan@boomzy.me"
# Password should be test123
user.password = 'test123'
user.password_confirmation = 'test123'
user.bio = "I have been a photographer for over 40 years and I am always looking for new subjects. I moved to Amsterdam last year with my partner and am still looking to build a community here."
user.motivation = "Photography and art are so important in difficult times like these. I hope to share the knowledge I've gained with people eager to learn!"
file = URI.open("https://images.unsplash.com/photo-1495580621852-5de0cc907d2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1530&q=80")
user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
user.save!

puts "----------------------------------------"
puts "[LOG] creating SUSAN's address..."


Address.create(
    city: "Amsterdam",
    address_line_1: "Willem Passtoorsstraat 104",
    postcode: "1073HX",
    addressable: user,
    )

puts "----------------------------------------"
puts "[LOG] creating SUSAN's first skill, listings and bookings..."


skill = Skill.create!(
    name: "Portrait Photography",
    category: "Photography",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Taking portraits with Susan",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "I have been a professional photographer for years, let me teach you about lighting and field of depth, my specialties"
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Willem Passtoorsstraat 104",
    postcode: "1073HX",
    addressable: listing
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Pending",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] SUSAN Completed ..."

puts "----------------------------------------"
puts "[LOG] creating Katya..."

user = User.new
user.first_name = "Katya"
user.last_name = "Rosa"
# Email should be first_name@boomzy.me
user.email = "katya@boomzy.me"
# Password should be test123
user.password = 'test123'
user.password_confirmation = 'test123'
user.bio = "I have been a photographer for over 40 years and I am always looking for new subjects. I moved to Amsterdam last year with my partner and am still looking to build a community here."
user.motivation = "Photography and art are so important in difficult times like these. I hope to share the knowledge I've gained with people eager to learn!"
file = URI.open("https://images.unsplash.com/photo-1547212371-eb5e6a4b590c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")
user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
user.save!

puts "----------------------------------------"
puts "[LOG] creating KATYA's address..."


Address.create(
    city: "Amsterdam",
    address_line_1: "Rooseveltlaan 124",
    postcode: "1078NW",
    addressable: user,
    )

puts "----------------------------------------"
puts "[LOG] creating KATYA's first skill, listings and bookings..."


skill = Skill.create!(
    name: "Needlepoint",
    category: "Crafts",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Needlepoint for Beginners",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "Come learn with me! I have always enjoyed teaching and miss meeting new people."
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Prinsengracht 279",
    postcode: "1016GW",
    addressable: listing
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Pending",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] KATYA Completed ..."

puts "----------------------------------------"
puts "[LOG] creating HANS..."

user = User.new
user.first_name = "Hans"
user.last_name = "de Vrij"
# Email should be first_name@boomzy.me
user.email = "hans@boomzy.me"
# Password should be test123
user.password = 'test123'
user.password_confirmation = 'test123'
user.bio = "Recently retired contracter. Just passed on the reigns of my business to my daughter, but hoping to continue to teach new people my craft!"
user.motivation = "Now that I am retired I can focus on building projects that bring joy. I could use an apprentice, for the talks, the joy of teaching, and the heavy lifting"
file = URI.open("https://images.manmadediy.com/ihUorZzi3I-w0F39kfzjaAljHuGgfxZvM0QlhcM4bUQ/w:800/plain/http://s3.amazonaws.com/manmadediy-uploads-production/photos/17768/offermanwood2_span.jpg")
user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
user.save!

puts "----------------------------------------"
puts "[LOG] creating HANS's address..."


Address.create(
    city: "Amsterdam",
    address_line_1: "Meteorensingel 156",
    postcode: "1033CC",
    addressable: user,
    )

puts "----------------------------------------"
puts "[LOG] creating HANS' first skill, listings and bookings..."


skill = Skill.create!(
    name: "Woodworking",
    category: "Woodworking",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Building wooden furniture with Hans",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "Forget Ikea, I will teach you to make beautiful tables that will last decades!"
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Dam 20",
    postcode: "1012NP",
    addressable: listing
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Pending",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] HANS Completed ..."

puts "----------------------------------------"
puts "[LOG] creating ARNOLD..."

user = User.new
user.first_name = "Arnold"
user.last_name = "Golding"
# Email should be first_name@boomzy.me
user.email = "arnold@boomzy.me"
# Password should be test123
user.password = 'test123'
user.password_confirmation = 'test123'
user.bio = "I have traveled all over the world with my accordian. My traveling days might be behind me, but I am happy staying put and playing on the porch everyday. My granddaughter set this up for me!"
user.motivation = "Playing solo is wonderful, but I miss teaching and playing with others. Come jam with me :)"
file = URI.open("https://images.pexels.com/photos/228842/pexels-photo-228842.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
user.save!

puts "----------------------------------------"
puts "[LOG] creating ARNOLD's address..."


Address.create(
    city: "Amsterdam",
    address_line_1: "Plantage Kerklaan 61",
    postcode: "1018CX",
    addressable: user,
    )

puts "----------------------------------------"
puts "[LOG] creating ARNOLD' first skill, listings and bookings..."


skill = Skill.create!(
    name: "Accordian Accords",
    category: "Music",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Building wooden furniture with Hans",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "Play a song for me and I'll teach you to play it on the accordian."
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Korte Leidsedwarsstraat 111",
    postcode: "1017PX",
    addressable: listing
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Accepted",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] ARNOLD Completed ..."



puts "----------------------------------------"
puts "[LOG] creating ALEX..."

user = User.new
user.first_name = "Alex"
user.last_name = "Botwinick"
# Email should be first_name@boomzy.me
user.email = "alex@boomzy.me"
# Password should be test123
user.password = 'test123'
user.password_confirmation = 'test123'
user.bio = "Former philosophy student turned barista/writer. Born in the Finger Lakes in Upstate New York and just moved to Europe at the new year after a decade living in NYC. Into footy and social justice. And books."
user.motivation = "I've learnt some great skills at Le Wagon, but I'm always learning."
file = URI.open("https://avatars3.githubusercontent.com/u/62389585?s=400&u=aea24e31a86a8bdf2c351edfcea1112100e37996&v=4")
user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
user.save!

puts "----------------------------------------"
puts "[LOG] creating Alex's address..."


Address.create(
    city: "Amsterdam",
    address_line_1: "Eerste Atjehstraat 164",
    postcode: "1094KX",
    addressable: user,
    )

puts "----------------------------------------"
puts "[LOG] creating Alex' first skill, listings and bookings..."


skill = Skill.create!(
    name: "Ruby on Rails",
    category: "Programming",
    user_id: user.id,
    )

listing = Listing.create!(
    title: "Learn Rails with Alex",
    user_id: user.id,
    skill_id: skill.id,
    skill_level: "Advanced",
    description: "I've built some great projects on Rails, come and learn how to build web apps like Boomzy"
    )

Address.create(
    city: "Amsterdam",
    address_line_1: "Eerste Atjehstraat 164",
    postcode: "1094KX",
    addressable: listing
    )

booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: "Accepted",
    listing_id: listing.id,
    )

puts "----------------------------------------"
puts "[LOG] ALEX Completed ..."




puts "[LOG] STARTING SEED GENERATION..."


# --------------------
#  CREATE USERS - ADMIN
# --------------------
puts "----------------------------------------"
puts "[LOG] creating ADMIN users..."
a = 0
ADMINS.each do |admin|
  user = User.new
  user.first_name = admin[0]
  user.last_name = "Admin"
  user.email = admin[1]
  user.password = 'admin1'
  user.password_confirmation = 'admin1'
  user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo imperdiet turpis, eget imperdiet dolor facilisis quis."
  user.motivation = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo imperdiet turpis"
  file_admin = URI.open("https://source.unsplash.com/900x900/?headshot")
  user.photo.attach(io: file_admin, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
  user.save!
  a += 1
end
puts "[LOG] #{a} ADMINS created"


# # -------------------
# # CREATE USERS - TEST
# # -------------------
# puts "----------------------------------------"
# puts "[LOG] creating TEST users..."
# i = 0
# 10.times do
#   user = User.new
#   user.first_name = Faker::Name.first_name
#   user.last_name = Faker::Name.last_name
#   user.email = Faker::Internet.email
#   user.password = 'test123'
#   user.password_confirmation = 'test123'
#   user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo imperdiet turpis, eget imperdiet dolor facilisis quis. Nam sed iaculis purus. Praesent tincidunt congue ex, ut congue lacus rutrum faucibus. Nullam posuere urna eget enim rhoncus imperdiet. Aenean ut blandit nulla. Aenean dapibus non lectus et gravida. Curabitur at urna vestibulum, mattis risus vitae, consectetur elit. Morbi fringilla neque nec libero dapibus, non dapibus dui dignissim."
#   user.motivation = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo imperdiet turpis, eget imperdiet dolor facilisis quis. Nam sed iaculis purus. Praesent tincidunt congue ex, ut congue lacus rutrum faucibus."
#   file = URI.open("https://source.unsplash.com/900x900/?headshot")
#   user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
#   user.save!
#   i += 1
# end

# puts "[LOG] #{i} USERS created"
# puts "----------------------------------------"
# puts "[LOG] #{User.count} TOTAL users created"


# # ----------------
# # CREATE ADDRESSES
# # ----------------
# puts "----------------------------------------"
# puts "[LOG] creating ADDRESSES..."
# User.all.each_with_index do |user, index|
#   location = STREETS_ZIPS.sample

#   Address.create(
#     city: "Amsterdam",
#     address_line_1: location[0],
#     postcode: location[1],
#     addressable: user
#     )
# # Address.create!(address_line_1: "Elandsgracht 86", postcode: "1016TZ", city: "Amsterdam", addressable_type: "User", addressable_id: User.first.id)

# end
# puts "[LOG] #{Address.count} ADDRESSES created"



# # -------------
# # CREATE SKILLS
# # -------------

# puts "----------------------------------------"
# puts "[LOG] creating SKILLS..."

# User.all.each do |user|
#   skill = Skill.create!(
#     name: Faker::Job.title,
#     category: CATEGORIES.sample,
#     user_id: user.id
#     )
# end
# puts "[LOG] #{Skill.count} SKILLS created"


# # ---------------
# # CREATE LISTINGS
# # ---------------
# puts "----------------------------------------"
# puts "[LOG] creating LISTINGS..."

# User.all.each do |user|
#   listing = Listing.create!(
#     title: Faker::Book.title,
#     user_id: user.id,
#     skill_id: Skill.all.sample.id,
#     skill_level: LEVELS.sample,
#     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
#     )
# end
# puts "[LOG] #{Listing.count} LISTINGS created"

# # ------------------------
# # CREATE LISTING ADDRESSES
# # ------------------------
# puts "----------------------------------------"
# puts "[LOG] creating LISTING ADDRESSES..."
# Listing.all.each_with_index do |listing, index|
#   location = MEETING_SZ.sample
#   Address.create(
#     city: "Amsterdam",
#     address_line_1: location[0],
#     postcode: location[1],
#     addressable: listing
#     )
# # Address.create!(address_line_1: "Elandsgracht 86", postcode: "1016TZ", city: "Amsterdam", addressable_type: "User", addressable_id: User.first.id)

# end
# puts "[LOG] #{Address.count} ADDRESSES created"

# # ---------------
# # CREATE BOOKINGS
# # ---------------
# puts "----------------------------------------"
# puts "[LOG] creating BOOKINGS..."

# Listing.all.each do |listing|
#   booking = Booking.create(
#     date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
#     user_id: User.all.sample.id,
#     status: STATUS.sample,
#     listing_id: listing.id,
#     )
# end
# puts "[LOG] #{Booking.count} BOOKINGS created"

# ---------------
# CREATE CHATROOMS
# ---------------
puts "----------------------------------------"
puts "[LOG] creating CHATROOMS..."

Booking.all.each do |booking|
  chatroom = Chatroom.new
  chatroom.booking = booking
  chatroom.save
end
puts "[LOG] #{Chatroom.count} CHATROOMS created"

# ---------------
# CREATE REVIEWS
# ---------------
puts "----------------------------------------"
puts "[LOG] creating REVIEWS..."

Booking.all.each do |booking|
  review = Review.create!(
    content: "My meeting was so great!",
    rating: rand(1..5),
    user_id: User.all.sample.id
    )
end

puts "[LOG] #{Review.count} REVIEWS created"

puts "----------------------------------------"
puts "[LOG] End time: #{Time.now}"

