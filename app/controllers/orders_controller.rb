class OrdersController < ApplicationController
  before_action :get_product, only: [:new, :create, :index]
  before_action :find_order, only: [:edit, :update, :destroy, :show]
  def index
    @orders = @product.orders
  end

  def show
  end

  def new
    @order = @product.orders.build
  end

  def create 
    @order = @product.orders.build(create_orders)
    if @order.save
      flash[:notice] = "Order has been successfully created......"
      redirect_to product_orders_path(@product, @order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @order.update(create_orders)
      flash[:notice] = "Order has been successfully edited......."
      redirect_to order_path(@order)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    @order.destroy
    redirect_to product_path
  end

  private

  def get_product  
    @product = Product.find_by_id(params[:product_id])
  end

  def find_order
    @order = Order.find_by_id(params[:id])
  end

  def create_orders
    params.require(:order).permit(:quantity, :total_price, :product_id)
  end
end
