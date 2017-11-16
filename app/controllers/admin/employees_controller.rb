class Admin::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def show

  end

  def set_employee
    @employee = Employee.find_by(id: params[:id])
  end

end
