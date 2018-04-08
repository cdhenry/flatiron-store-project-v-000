class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      belongs_to :user
      belongs_to :order
    end
  end
end
