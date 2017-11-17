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
      if employee_params[:shift].values[1..-1].any? {|answer| !answer.empty?}
        @shift = @employee.shifts.build(employee_params[:shift])
        if !@shift.save
          redirect_to new_admin_employee_shift_path(@employee, @shift), alert: "The employee was saved, but the shift was not. Try adding a shift for this employee below."
        end
      end
      return admin_employee_url(@employee)
    else
      @shift ||= @employee.shifts.build
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

  def associates
    @employees = Employee.associates
    render 'admin/employees/index'
  end


  private
  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def employee_params
     params.require(:employee).permit(:first_name, :last_name, :email, :date_hired, :role, :password, :shift => [:published, :date, :start_time, :end_time])
  end

end
