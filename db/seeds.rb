
require 'faker'
require "open-uri"

puts "Start time = #{Time.now}"
puts "Emptying database"

Review.destroy_all
Booking.destroy_all
Skill.destroy_all
User.destroy_all

STREETS = [
  "Westzaanstraat 10",
  "Willem Passtoorsstraat 104",
  "Rooseveltlaan 124",
  "Meteorensingel 156",
  "IJsbaanpad 9",
  "Korte Leidsedwarsstraat 111",
  "Prinsenstraat 22",
  "Lindengracht 75",
  "Plantage Kerklaan 61",
  "Javaplein 23"
]
POSTCODES = [
  "1013 NG",
  "1073 HX",
  "1078 NW",
  "1033 CC",
  "1076 CV",
  "1017 PX",
  "1015 DD",
  "1015 KD",
  "1018 CX",
  "1095 CJ"
]

CATEGORIES = %w(Crafts Woodworking Painting Music Writing Entrepreneurship Photography Drawing Gardening)
STATUS = %w(pending accepted denied)


puts "creating new users..."
i=0

10.times do
  address = Address.new
  address.city = "Amsterdam"
  address.address_line_1 = STREETS[i]
  address.postcode = POSTCODES[i]
  i+=1
  10.times do
    user = User.new
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.email = Faker::Internet.email
    user.password = 'valid_password'
    user.password_confirmation = 'valid_password'
    user.address = address
    # file = URI.open("https://source.unsplash.com/900x900/?headshot")
    # user.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
    user.save!

    4.times do
      skill = Skill.new
      skill.name = Faker::Games::Zelda.item
      skill.category = CATEGORIES.sample
      # file = URI.open("https://source.unsplash.com/1600x900/?#{skill.name}")
      # skill.photo.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')
      # skill.user = user
      skill.save!

      2.times do
        booking = Booking.new
        booking.start_date = Faker::Date.between(from: '2020-09-23', to: '2020-09-25')
        booking.end_date = Faker::Date.between(from: '2020-09-26', to: '2020-09-29')
        booking.status = STATUS.sample
        # booking.user = user
        # booking.skill = skill
        booking.save

        3.times do
          review = Review.new
          review.content = Faker::Relationship.familial
          review.rating = rand(1..5)
          review.skill = skill
          review.save
        end
      end
    end
  end
end

puts "#{User.count} users created"
puts "#{Skill.count} skills created"
puts "#{Review.count} reviews created"
puts "#{Booking.count} bookings created"

puts "----------------------------------------"
puts "End time #{Time.now}"

