
require 'faker'
require "open-uri"

puts "Start time = #{Time.now}"
puts "Emptying database"

Review.destroy_all
Booking.destroy_all
Skill.destroy_all
User.destroy_all



CATEGORIES = %w(Crafts Woodworking Painting Music Writing Entrepreneurship Photography Drawing Gardening)
STATUS = %w(Pending Accepted Denied)
LEVEL = %w(Master Advanced Recreational Beginner Novice)

# Addresses for user. Not sure how Polymorphic assoc. affects these, if at all.
STREETS_ZIPS = [
  ["Westzaanstraat 10", "1013 NG"],
  ["Willem Passtoorsstraat 104", "1073 HX"],
  ["Rooseveltlaan 124", "1078 NW"],
  ["Meteorensingel 156", "1033 CC"],
  ["IJsbaanpad 9", "1076 CV"],
  ["Korte Leidsedwarsstraat 111", "1017 PX"],
  ["Prinsenstraat 22", "1015 DD"],
  ["Lindengracht 75", "1015 KD"],
  ["Plantage Kerklaan 61", "1018 CX"],
  ["Javaplein 23", "1095 CJ"]
]

# Addresses for booking location
MEETING_SZ = [
  ["Museumstraat 1", "1071 XX"],
  ["Dam 20", "1012 NP Amsterdam"],
  ["Nieuwezijds Voorburgwal 147", "1012 RJ"],
  ["Museumplein 6", "1071 DJ"],
  ["Kalverstraat 92", "1012 PH"],
  ["Prinsengracht 279", "1016 GW"],
  ["Dam 1", "1012 JS Amsterdam"],
  ["Rokin 78", "1012 KW"],
  ["Keizersgracht 609", "1017 DS"],
  ["Prinsengracht 279a", "1016 GW"]
]

ADMINS = [
  ["Marielle", "marielle@test.com"],
  ["Tommy", "tommy@test.com"],
  ["Will", "will@test.com"],
  ["Alex", "alex@test.com"]
]


# --------------------
# CREATE USERS - ADMIN
# --------------------
puts "----------------------------------------"
puts "[LOG] creating ADMIN users..."
a = 0
ADMINS.each do |admin|
  User.create(
    first_name: admin[0],
    last_name: "Admin",
    email: admin[1],
    password: 'admin1',
    password_confirmation: 'admin1'
  )
  a += 1
end
puts "[LOG] #{a} ADMINS created"


# -------------------
# CREATE USERS - TEST
# -------------------
puts "----------------------------------------"
puts "[LOG] creating TEST users..."
i = 0
10.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = 'test123'
  user.password_confirmation = 'test123'
  user.save!
  i += 1
end

puts "[LOG] #{i} USERS created"
puts "----------------------------------------"
puts "[LOG] #{User.count} TOTAL users created"


# ----------------
# CREATE ADDRESSES
# ----------------
puts "----------------------------------------"
puts "[LOG] creating ADDRESSES..."
User.all.each_with_index do |user, index|
  Address.create(
    city: "Amsterdam",
    address_line_1: STREETS_ZIPS.sample[0],
    postcode: STREETS_ZIPS.sample[1],
    addressable: user
  )
end
puts "[LOG] #{Address.count} ADDRESSES created"


# -------------
# CREATE SKILLS
# -------------

puts "----------------------------------------"
puts "[LOG] creating SKILLS..."

User.all.each do |user|
  skill = Skill.create!(
    name: Faker::Job.title,
    category: CATEGORIES.sample,
    user_id: user
  )
end
puts "[LOG] #{Skill.count} SKILLS created"

# ---------------
# CREATE LISTINGS
# ---------------


# ---------------
# CREATE BOOKINGS
# ---------------



# ---------------
# CREATE REVIEWS
# ---------------


# puts "----------------------------------------"
# puts "[LOG] End time: #{Time.now}"

#   # file = URI.open("https://source.unsplash.com/900x900/?headshot")
#   # user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
#   user.save!

#     3.times do
#       skill = Skill.new
#       skill.name = Faker::Games::Zelda.item
#       skill.category = CATEGORIES.sample
#       skill.user_id = user.id
#       # file = URI.open("https://source.unsplash.com/1600x900/?#{skill.name}")
#       # skill.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
#       # skill.user = user
#       skill.save!
#       user_skill = UserSkill.new
#       user_skill.skill_level = LEVEL.sample
#       user_skill.description = Faker::TvShows::Seinfeld
#       user_skill.title = skill.name
#     end

#     10.times do
#       booking = Booking.new
#       booking.date = Faker::Date.between(from: '2020-09-23', to: '2020-09-25')
#       # booking.end_date = Faker::Date.between(from: '2020-09-26', to: '2020-09-29')
#       booking.status = STATUS.sample
#       address2 = Address.new
#       address2.city = "Amsterdam"
#       address2.postcode = MEETING_SZ[i][1]
#       address2.address_line_1 = MEETING_SZ[i][0]
#       booking.address = address2

#       booking.user = user
#       booking.skill = skill

#       booking.save

#       3.times do
#         review = Review.new
#         review.content = Faker::TvShows::Seinfeld
#         review.rating = rand(1..5)
#         review.skill = skill
#         review.save

#       end
#     end
#   i += 1
# end


