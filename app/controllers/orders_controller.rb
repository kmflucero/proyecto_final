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
      if @order.destroy?
        redirect_to orders_path, notice: 'Carro actualizado'
      else
        redirect_to orders_path, notice: 'no se pudo actualizar'
      end
    elsif @order.quantity > 1
      @order.quantity -= 1
      if @order.save
        redirect_to orders_path, notice: 'Carro actualizado'
      else
        redirect_to orders_path, notice: 'No se h podido actualizar'
      end
    end
  end

  def create
    @previous_order= Order.find_by(user_id: current_user.id, product_id: params[:product_id], payed: false)
    if @previous_order.present?
      new_quantity = @previous_order.quantity + 1
      @previous_order.update(quantity: new_quantity)
      redirect_to root_path, notice: 'Se ha agregado orden con exito'
    else
      @order = Order.new
      @product = Product.find(params[:product_id])
      @order.product = @product
      @order.price =  @product.price
      @order.user = current_user
      if @order.save
        redirect_to root_path, notice: 'Se ha agregado orden con exito'
      else
        redirect_to root_path, alert: 'No se ha agregado orden con exito'
      end
    end
  end
end
