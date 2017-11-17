class Admin::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @shift = Shift.new
  end

  def create
    binding.pry

    @employee = Employee.new
    @employee.first_name = employee_params[:first_name]
    @employee.last_name = employee_params[:last_name]
    @employee.email = employee_params[:email]
    @employee.date_hired = employee_params[:date_hired]
    @employee.role = employee_params[:role]
    @employee.password = employee_params[:password]

    if @employee.save
      @shift = @employee.shifts.build(published: employee_params[:shift][:published], date: employee_params[:shift][:date], start_time: employee_params[:shift][:start_time], end_time: employee_params[:shift][:end_time], channel_id: employee_params[:shift][:channels][:channel])

      if @shift.save
        redirect_to admin_employee_path(@employee)
      else
        #make sure shift saves also - otherwise go to employees/:id/shift/now
        redirect_to root_path
      end
    else
      render 'admin/employees/new'
    end
  end

  def show
  end

  def destroy
    #build this out
    redirect_to employees_path
  end

  def edit
  end

  def update
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
