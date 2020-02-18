class BookingsController < ApplicationController
  def create
    @item = Item.find(params['item_id'])
    has_booking = !@item.booking.nil?
    @booking = Booking.new(item: @item, user: current_user)
    authorize @booking
    if !has_booking
      if @booking.save
        redirect_to items_path
        return
      end
    end
    render 'items/show', notice: 'Could not book'
  end
end
