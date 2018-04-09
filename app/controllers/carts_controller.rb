class CartsController < ApplicationController
  def checkout
    current_cart.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      item.inventory = item.inventory - line_item.quantity
      item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(params[:id])
  end
end
