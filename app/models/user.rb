class User < ActiveRecord::Base
  has_many :carts
  has_many :orders, through: :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_cart
    @current_cart
  end

  def current_cart=(cart)
    @current_cart = cart
  end
end
