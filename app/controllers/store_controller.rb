class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.available_items
  end

  def show
    @item = Item.find(params[:id])
  end

  
  
end
