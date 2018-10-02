require 'test/unit'
require 'json'

require_relative 'booking'

class TestMain < Test::Unit::TestCase
  def setup
    file = File.read('input.json')
    @data_hash = JSON.parse(file)
  end

  def test_booking_has_correct_first_checkin
    booking = Booking.new(@data_hash["bookings"][0])

    assert_equal "first_checkin", booking.first_checkin[:mission_type]
    assert_equal "2016-10-10", booking.first_checkin[:date]
  end

  def test_booking_has_correct_last_checkout
    booking = Booking.new(@data_hash["bookings"][0])

    assert_equal "last_checkout", booking.last_checkout[:mission_type]
    assert_equal "2016-10-15", booking.last_checkout[:date]
  end

  def test_booking_has_correct_checkout_checkin
    booking = Booking.new(@data_hash["bookings"][0])

    assert_equal "checkout_checkin", booking.checkout_checkin[0][:mission_type]
    assert_equal "2016-10-13", booking.checkout_checkin[0][:date]
  end

  def test_booking_has_correct_room_number
    booking = Booking.new(@data_hash["bookings"][0])

    assert_equal 2, booking.listing_room_number
  end

  def test_booking_has_correct_job_prices
    booking = Booking.new(@data_hash["bookings"][0])

    assert_equal 20, booking.job_price("first_checkin")
    assert_equal 10, booking.job_price("last_checkout")
    assert_equal 20, booking.job_price("checkout_checkin")

    assert_equal 20, booking.first_checkin[:price]
    assert_equal 10, booking.last_checkout[:price]
    assert_equal 20, booking.checkout_checkin[0][:price]
  end

  def test_booking_has_correct_missions
    booking = Booking.new(@data_hash["bookings"][0])
    first_checkin = {:listing_id=>1, :mission_type=>"first_checkin", :date=>"2016-10-10", :price=>20}
    last_checkout = {:listing_id=>1, :mission_type=>"last_checkout", :date=>"2016-10-15", :price=>10}
    checkout_checkin = {:listing_id=>1, :mission_type=>"checkout_checkin", :date=>"2016-10-13", :price=>20}

    assert_equal first_checkin, booking.missions[0]
    assert_equal last_checkout, booking.missions[1]
    assert_equal checkout_checkin, booking.missions[2]
  end
end
