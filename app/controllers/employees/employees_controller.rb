class Employees::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    raise params.inspect
  end

  def show
  end

  def destroy
    #build this out
    redirect_to admin_employees_path
  end

  def edit
  end

  def update
    raise params.inspect
  end


  private
  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def employee_params
    #need to modify to accept params for shifts too
     params.require(:employee).permit(:first_name, :last_name, :email, :date_hired, :role)
  end

end
