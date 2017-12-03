class Supervisor::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :require_login, :require_supervisor
  skip_before_action :require_supervisor, only: [:index, :show]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to supervisor_employee_url(@employee)
    else
      render 'supervisor/employees/new'
    end
  end

  def show
  end

  def destroy
    @employee.destroy
    redirect_to supervisor_employees_path
  end

  def edit
  end

  def update
    @employee.update_from_params(employee_params)
    if @employee.save
      redirect_to supervisor_employee_path(@employee)
    else
      render 'supervisor/employees/edit'
    end
  end

  def associates
    @employees = Employee.associates
    render 'supervisor/employees/index'
  end


  private
  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def employee_params
     params.require(:employee).permit(:first_name, :last_name, :email, :date_hired, :role, :password)
  end

end
