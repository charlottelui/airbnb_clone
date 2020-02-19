class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :destroy_photo]
  def index
    if params[:query].present?
      @items = policy_scope(Item.search_by_title_and_description(params[:query]))
    else
      @items = policy_scope(Item).order(created_at: :desc)
    end
  end

  def show

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
    params.require(:item).permit(:title, :description, :price, photos: [])
  end
end
