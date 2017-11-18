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
    @schedule = Schedule.new(schedule_params)
    @schedule.build_schedule
    redirect_to schedule_path(@schedule)
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
  end

end
