class Admin::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
end
