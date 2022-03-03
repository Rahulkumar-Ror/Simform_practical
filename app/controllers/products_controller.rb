class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    # binding.pry
    @product = Product.new
  end

  def create
    # binding.pry
    @product = Product.new(create_products)
    if @product.save
      flash[:notice] = "Product has been successfully created......"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product = Product.update(create_products)
      flash[:notice] = "Product has been successfully edited......."
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end

  def create_products
    params.require(:product).permit(:title, :description, :price)
  end
end
