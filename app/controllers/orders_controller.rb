class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.cart
    @total = @orders.inject(0) {|total, order| total += (order.product.price * order.quantity) }
  end

  def empty_cart
    current_user.cart.destroy_all
    redirect_to root_path
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.quantity==1
      @order.destroy!
    elsif @order.quantity > 1
      @order.quantity -= 1
      @order.save
      
    end
  end

  def create
      @orders = Order.all
      @order = Order.new
    @previous_order= Order.find_by(user_id: current_user.id, product_id: params[:product_id], payed: false)
    if @previous_order.present?
      new_quantity = @previous_order.quantity + 1
      @previous_order.update(quantity: new_quantity)
      
    else
      @product = Product.find(params[:product_id])
      @order.product = @product
      @order.price =  @product.price
      @order.user = current_user
      @order.save
       
    end
  end
end
