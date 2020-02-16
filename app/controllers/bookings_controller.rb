class BookingsController < ApplicationController
  def create
    item = Item.find(params['item_id'])
    @booking = Booking.new(item: item, user: current_user)
    @booking.save
  end
end
