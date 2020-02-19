class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :destroy_photo]
  def index
    if params[:query].present?
      @items = policy_scope(Item.search_by_title_and_description(params[:query]))
    else
      @items = policy_scope(Item.geocoded).order(created_at: :desc)
    end
    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        image_url: helpers.asset_url('trash-solid')

      }
    end
  end

  def show
    seller = @item.user
    @first_three_items = seller.items.reject{|item| item == @item}.take(3)
    @first_photo = @item.photos.first
    @remaining_photos = @item.photos.reject{|photo| photo == @first_photo}
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item
    if @item.save
      redirect_to item_path(@item), notice: 'item was successfully added.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "item was successfully deleted"
  end

  def destroy_photo
    photo = @item.photos.find(params['photo_id'])
    photo.purge unless photo.nil?
    redirect_to edit_item_path(@item)
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :address, photos: [])
  end
end
