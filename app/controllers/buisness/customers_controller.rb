class Buisness::CustomersController < ApplicationController
  def index
    @customers = Customer.all 
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create 
    @customer = Customer.new(input_customers)
    if @customer.save 
      flash[:notice] = 'Customer has been successfully created'
      redirect_to buisness_customers_path
    else 
      render :new, status: :unprocessable_entity
    end
  end  
  
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(input_customers)
      flash[:notice] = "Customer successfully edited"
      redirect_to buisness_customers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete_customer 
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to delete_customer_buisness_customer_path
  end

  def preview
    @customer = Customer.find(params[:id])
  end

  def search
    if params[:query].present?
      @customer_search = Customer.where("first_name LIKE '%#{params[:query]}%'")
    else
      @customer_search = Customer.all 
    end
  end
  private

  def input_customers
		params.require(:customer).permit(:first_name, :last_name, :phone_number, :email)
  end
end
