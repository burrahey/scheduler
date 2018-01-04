class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy, :publish]
  before_action :require_login, :require_supervisor
  skip_before_action :require_login, only: :home
  skip_before_action :require_supervisor, only: [:home, :index, :show]

  def home
  end

  def index
    @schedules = resource_scope(Schedule)
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
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @schedule, include: 'shifts,shifts.employee' }
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  def publish
    @schedule.publish_and_save
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
