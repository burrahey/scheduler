class Admin::ShiftsController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index

  end

  def new
  end

  def create
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
  def set_employee
    @employee = Employee.find_by(id: params[:employee_id])
  end

end
