class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer
  before_action :correct_customer

  def show
  end

  def edit

  end

  def update
    @customer = Customer.find_by_id(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :encrypted_password)
  end

  def set_customer
    @customer = Customer.find_by_id(params[:id])
  end

  def correct_customer
    if @customer != current_customer
      sign_out_and_redirect(current_customer)
    end
  end
end
