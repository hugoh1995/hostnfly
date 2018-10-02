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
end
