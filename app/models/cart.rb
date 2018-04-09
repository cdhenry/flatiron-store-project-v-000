class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total_price = 0.0
    self.line_items.each do |line_item|
      item = Item.find(line_item.item_id)
      total_price = total_price + (item.price * line_item.quantity)
    end
    total_price
  end

  def add_item(item_id)
    if line_item = LineItem.find_by(item_id: item_id, cart_id: self.id)
      line_item.quantity = line_item.quantity + 1
      line_item
    else
      LineItem.new(item_id: item_id, cart_id: self.id)
    end
  end
end
