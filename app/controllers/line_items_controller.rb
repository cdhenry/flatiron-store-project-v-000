class LineItemsController < ApplicationController
  def create
    if !current_cart
      current_user.current_cart = current_user.carts.create
      current_user.save
    end
    if current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end
  end
end
