class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]


  def show
    
    @current_cart = @cart
  end

   def checkout
    @current_cart = Cart.find(params[:id])
    @current_cart.checkout
    current_user.remove_cart
    redirect_to cart_path(@current_cart)
  end

  private

   def set_cart
    @cart = Cart.find(params[:id])
  end



end
