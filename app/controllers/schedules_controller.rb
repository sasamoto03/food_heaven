class SchedulesController < ApplicationController
  
  def new
    @schedule =  Schedule.new
    @date = params[:date]
  end
  def show
    @schedule = Schedule.find(params[:id])
  end

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def update
  end

  def destroy
  end

  def create
  end

  private

  def blog_parameter
    params.require(:schedule).permit(:customer_id, :title, :start_date)
  end
end
