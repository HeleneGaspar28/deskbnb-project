# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
User.destroy_all
Desk.destroy_all

puts "creating users..."

helene = User.create!(name: "Helene", email: "helene@example.com", password: "123456789")

ana = User.create!(name: "Ana", email: "ana@example.com", password: "123456789")

axel = User.create!(name: "Axel", email: "axel@example.com", password: "123456789")

puts "Users created !"

puts "created desks"

brussels_desk = Desk.create!(title: "Brussels", description: "nice and cosy desk", price_per_hour: 3.5, address: "Brussels", user_id: axel.id)

utrecht_desk = Desk.create!(title: "Utrecht", description: "nice and cosy desk", price_per_hour: 3.5, address: "Utrecht", user_id: ana.id)

paris_desk = Desk.create!(title: "Paris", description: "nice and cosy desk", price_per_hour: 5, address: "Paris", user_id: helene.id)

puts "created desks !"

puts "creating bookings ..."

paris_booking = Booking.create!(user_id: ana.id, desk_id: paris_desk.id, start_time: Time.now, end_time: Time.now + 2.hours, status: 0)

utrecht_booking = Booking.create!(user_id: axel.id, desk_id: utrecht_desk.id, start_time: Time.now, end_time: Time.now + 2.hours, status: 1)

brussels_booking = Booking.create!(user_id: helene.id, desk_id: brussels_desk.id, start_time: Time.now, end_time: Time.now + 2.hours, status: 2)

puts "created bookings"
