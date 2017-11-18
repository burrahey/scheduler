class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :show, :update, :destroy]

  def home
  end

  def index
    @schedules = Schedule.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def schedule_params
  end

  def set_schedule
  end

end
