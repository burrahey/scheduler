class Admin::ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :set_employee, only: :create
  def index

  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = @employee.shifts.build(shift_params)

    if @shift.save
      redirect_to admin_employee_shift_path(@employee, @shift)
    else
      render 'admin/shifts/new'
    end
  end

  def update
  end

  def destroy
  end

  def show
  end

  def edit
  end

  private
  def set_shift
    @shift = Shift.find_by(id: params[:id])
  end

  def set_employee
    @employee = Employee.find_by(id: params[:employee_id])
  end

  def shift_params
     params.require(:shift).permit(:date, :start_time, :end_time, :published)
  end
end
