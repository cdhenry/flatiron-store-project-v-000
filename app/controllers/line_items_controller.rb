class LineItemsController < ApplicationController
  def create
    if !current_cart
      current_user.current_cart = current_user.carts.create
      current_user.save
    end

    if line_item = LineItem.find_by(item_id: params[:item_id], cart_id: current_cart.id)
      line_item.quantity = line_item.quantity + 1
      line_item.save
    else
      LineItem.create(item_id: params[:item_id], cart_id: current_cart.id)
    end

    redirect_to cart_path(current_cart)
  end
end
