require 'json'
require 'date'

class Booking
  attr_reader :id, :listing_id, :start_date, :end_date

  def initialize(data)
    @id = data["id"]
    @listing_id = data["listing_id"]
    @start_date = data["start_date"]
    @end_date = data["end_date"]
  end

  def mission(type, date)
    {:listing_id=> @listing_id, :mission_type=> type, :date=> date, :price=> :FIXME}
  end

  def first_checkin
    mission("first_checkin", @start_date)
  end

  def last_checkout
    mission("last_checkout", @end_date)
  end

  def file
    JSON.parse(File.read('input.json'))
  end

  def reservations
    # Select all reservations for current booking
    file["reservations"].select { |reservation|
      reservation["listing_id"] == @listing_id && Date.parse(reservation["start_date"]) >= Date.parse(@start_date) && Date.parse(reservation["end_date"]) <= Date.parse(@end_date) && reservation["end_date"] != @end_date } || []
  end

  def checkout_checkin
    reservations.map{|reservation| mission("checkout_checkin", reservation["end_date"]) }
  end

  def listing_room_number
    file["listings"].find { |listing| listing["id"] == @listing_id }["num_rooms"]
  end
end
