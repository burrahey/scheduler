class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy]

  def home
  end

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    if !schedule_params[:start_date].empty?
      @schedule = Schedule.new(schedule_params)
      @schedule.build_schedule
      @schedule.save
      redirect_to schedule_path(@schedule)
    else
      redirect_to new_schedule_path, alert: 'Please enter a valid date'
    end
  end

  def show
  end

  def destroy
  end

  private
  def schedule_params
    params.require(:schedule).permit(:start_date)
  end

  def set_schedule
    @schedule = Schedule.find_by(id: params[:id])
  end

end
