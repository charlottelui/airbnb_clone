class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = policy_scope(Item)
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

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, photos: [])
  end
end
