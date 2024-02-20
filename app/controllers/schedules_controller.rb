class SchedulesController < ApplicationController

  def new
    @date = params[:date]
    @schedule = Schedule.new(start_time: @date.to_date, end_time: @date.to_date)
  end

  def show
    @date = params[:date]
    @schedule = Schedule.find(params[:id])
  end

  def index
    @schedules = Schedule.all
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to @schedule
    else
      render :edit
    end
  end

  def destroy
    schedules=Schedule.find(params[:id])
    schedules.destroy
    redirect_to '/schedules'
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.customer_id = current_customer.id
    @schedule.save
    redirect_to schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:customer_id, :title, :body, :start_time, :end_time)
  end
end
