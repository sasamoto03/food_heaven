class HomesController < ApplicationController
  before_action :current_customer_check
  
  def top
  end
  
  private
  
  def current_customer_check
    if current_customer
      redirect_to schedules_path
    end
  end
end
