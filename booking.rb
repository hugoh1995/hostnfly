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
end
