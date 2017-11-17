class Admin::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @shift = @employee.shifts.build
  end

  def create
    @employee = Employee.new_from_params(employee_params)

    if @employee.save
      if !employee_params[:shift][:start_time].empty?
        @shift = @employee.build_a_shift(employee_params[:shift])
        if @shift.save
          redirect_to admin_employee_path(@employee)
        else
          redirect_to new_admin_employee_shift_path(@employee), alert: "Failed to add a shift. Try again!"
        end
      end
      redirect_to admin_employee_path(@employee)
    else
      @shift = @employee.shifts.build
      render 'admin/employees/new'
    end
  end

  def show
  end

  def destroy
    @employee.destroy
    redirect_to admin_employees_path
  end

  def edit
  end

  def update
    @employee.update_from_params(employee_params)
    if @employee.save
      redirect_to admin_employee_path(@employee)
    else
      render 'admin/employees/edit'
    end
  end


  private
  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def employee_params
     params.require(:employee).permit(:first_name, :last_name, :email, :date_hired, :role, :password, :shift => [:published, :date, :start_time, :end_time, :channels => [:channel]])
  end

end
