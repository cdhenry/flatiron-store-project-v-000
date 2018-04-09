class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
  end

  def checkout
    cart = Cart.find(params[:id])
    cart.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory = item.inventory - line_item.quantity
      item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(params[:id])
  end

  def destroy

  end
end
