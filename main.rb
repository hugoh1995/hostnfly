require 'json'
require 'date'
require_relative 'booking'

file = File.read('input.json')
data_hash = JSON.parse(file)
bookings = data_hash["bookings"].map {|booking| Booking.new(booking)}

missions = Array.new

bookings.each do |booking|
  missions += booking.missions
end

missions_hash = { missions: missions }
