class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy, :publish]

  def home
  end

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    alert = Schedule.check_date_validity(schedule_params[:start_date])
    if !alert
      @schedule = Schedule.new(schedule_params)
      @schedule.build_schedule
      @schedule.save
      redirect_to schedule_path(@schedule)
    else
      redirect_to new_schedule_path, alert: alert
    end
  end

  def show
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  def publish
    @schedule.published = true
    @schedule.save
    redirect_to schedule_path(@schedule)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:start_date)
  end

  def set_schedule
    @schedule = Schedule.find_by(id: params[:id])
  end

end
