class ShiftsController < ApplicationController
  before_action :set_schedule, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    @shift.assign_attributes(shift_params)

    if @shift.save
      redirect_to schedule_path(@shift.schedule)
    else
      render 'admin/shifts/edit'
    end
  end

  def destroy
    @shift.destroy
    redirect_to schedule_path(@schedule)
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
