class Order < ActiveRecord::Base
  has_many :carts
  has_many :line_items, through: :carts
end
