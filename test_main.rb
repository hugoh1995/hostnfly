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
end
