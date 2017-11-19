class ShiftsController < ApplicationController
  before_action :set_schedule, only: [:new, :create]

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.schedule = @schedule
    if @shift.save
      redirect_to schedule_path(@schedule)
    else
      render 'new'
    end
  end

  private
  def set_schedule
    @schedule = Schedule.find_by(id: params[:schedule_id])
  end

  def shift_params
     params.require(:shift).permit(:date, :start_time, :end_time, :published, :employee_id, :schedule_id)
  end

  def set_shift
    @shift = Shift.find_by(id: params[:id])
  end
end
