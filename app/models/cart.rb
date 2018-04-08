class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total_price = 0.0
    self.items.each do |item|
      total_price = total_price + item.price
    end
    total_price
  end

  def add_item(item_id)
    if item = LineItem.find_by(item_id: item_id, cart_id: self.id)
      item.quantity = item.quantity + 1
      item
    else
      LineItem.new(item_id: item_id, cart_id: self.id)
    end
  end
end
