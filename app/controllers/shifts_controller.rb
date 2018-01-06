class ShiftsController < ApplicationController
  # before_action :set_schedule, only: [:new, :edit, :update, :destroy]
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :require_login, :require_supervisor

  def new
    @shift = Shift.new
  end

  def create
    binding.pry
    @shift = Shift.build_and_assign_schedule(shift_params)
    if @shift.save
      respond_to do |format|
        format.html { redirect_to schedule_path(@shift.schedule) }
        format.json { render json: @shift }
      end
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
      render 'shifts/edit'
    end
  end

  def destroy
    @schedule = @shift.schedule
    @shift.destroy
    redirect_to schedule_path(@schedule)
  end

  def index
    @shifts = [];
  end

  def search
    date_1 = params[:date_1]
    date_2 = params[:date_2]
    @shifts = Shift.find_between_dates(date_1, date_2)

    render 'index'
  end

  private
  def shift_params
     params.require(:shift).permit(:date, :start_time, :end_time, :published, :employee_id, :schedule_id)
  end

  def set_shift
    @shift = Shift.find_by(id: params[:id])
  end
end
