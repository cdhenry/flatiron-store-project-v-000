class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  has_many :line_items

  def total
    total_items = 0
    self.line_items.each do |line_item|
      total_items = total_items + line_item.quantity
    end
    total_items
  end
end
