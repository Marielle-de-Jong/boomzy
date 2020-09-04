
require 'faker'
require "open-uri"

puts "Start time = #{Time.now}"
puts "Emptying database"

Review.destroy_all
Booking.destroy_all
Listing.destroy_all
Skill.destroy_all
User.destroy_all




CATEGORIES = %w(Crafts Woodworking Painting Music Writing Entrepreneurship Photography Drawing Gardening)
STATUS = %w(Pending Accepted Denied)
LEVELS = %w(Beginner Intermediate Advanced Master)

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



puts "[LOG] STARTING SEED GENERATION..."


# --------------------
# CREATE USERS - ADMIN
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
  user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo imperdiet turpis, eget imperdiet dolor facilisis quis. Nam sed iaculis purus. Praesent tincidunt congue ex, ut congue lacus rutrum faucibus. Nullam posuere urna eget enim rhoncus imperdiet. Aenean ut blandit nulla. Aenean dapibus non lectus et gravida. Curabitur at urna vestibulum, mattis risus vitae, consectetur elit. Morbi fringilla neque nec libero dapibus, non dapibus dui dignissim."
  user.motivation = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas commodo imperdiet turpis, eget imperdiet dolor facilisis quis. Nam sed iaculis purus. Praesent tincidunt congue ex, ut congue lacus rutrum faucibus."
  file = URI.open("https://source.unsplash.com/900x900/?headshot")
  user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
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
  location = STREETS_ZIPS.sample

  Address.create(
    city: "Amsterdam",
    address_line_1: location[0],
    postcode: location[1],
    addressable: user
  )
# Address.create!(address_line_1: "Elandsgracht 86", postcode: "1016TZ", city: "Amsterdam", addressable_type: "User", addressable_id: User.first.id)

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
    user_id: user.id
  )
end
puts "[LOG] #{Skill.count} SKILLS created"


# ---------------
# CREATE LISTINGS
# ---------------
puts "----------------------------------------"
puts "[LOG] creating LISTINGS..."

User.all.each do |user|
  listing = Listing.create!(
    title: Faker::Book.title,
    user_id: user.id,
    skill_id: Skill.all.sample.id,
    skill_level: LEVELS.sample,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
  )
end
puts "[LOG] #{Listing.count} LISTINGS created"

# ------------------------
# CREATE LISTING ADDRESSES
# ------------------------
puts "----------------------------------------"
puts "[LOG] creating LISTING ADDRESSES..."
Listing.all.each_with_index do |listing, index|
  location = MEETING_SZ.sample
  Address.create(
    city: "Amsterdam",
    address_line_1: location[0],
    postcode: location[1],
    addressable: listing
  )
# Address.create!(address_line_1: "Elandsgracht 86", postcode: "1016TZ", city: "Amsterdam", addressable_type: "User", addressable_id: User.first.id)

end
puts "[LOG] #{Address.count} ADDRESSES created"

# ---------------
# CREATE BOOKINGS
# ---------------
puts "----------------------------------------"
puts "[LOG] creating BOOKINGS..."

Listing.all.each do |listing|
  booking = Booking.create(
    date: Faker::Date.between(from: '2020-09-23', to: '2020-09-25'),
    user_id: User.all.sample.id,
    status: STATUS.sample,
    listing_id: listing.id
  )
end
puts "[LOG] #{Booking.count} BOOKINGS created"

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

