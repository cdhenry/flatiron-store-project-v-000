class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status, default: "In Process"
    end
  end
end
