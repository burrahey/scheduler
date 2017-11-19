class Supervisor::ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :set_employee, only: [:create, :update, :destroy, :index]
  before_action :require_login, :require_supervisor
  skip_before_action :require_supervisor, only: :index


  def index
    @shifts = resource_scope(@employee.shifts) 
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.build_and_assign_schedule(shift_params, @employee.id)

    if @shift.save
      redirect_to schedule_path(@shift.schedule)
    else
      render 'supervisor/shifts/new'
    end
  end

  private
  def set_shift
    @shift = Shift.find_by(id: params[:id])
  end

  def set_employee
    @employee = Employee.find_by(id: params[:employee_id])
  end

  def shift_params
     params.require(:shift).permit(:date, :start_time, :end_time, :published, :employee_id)
  end
end
