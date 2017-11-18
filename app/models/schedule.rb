class Schedule < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :employees, through: :shifts

  def self.check_date_validity(date)
    if date.empty?
      return "Please enter a valid date"
    elsif Schedule.find_by(start_date: date.to_datetime.beginning_of_week)
      return "A schedule already exists for this time"
    else
      return nil
    end
  end

  def build_schedule
    self.set_start_date
    self.assign_shifts
  end

  def set_start_date
    self.start_date  = self.start_date.beginning_of_week
  end

  def assign_shifts
    date = self.start_date
    @employees = Employee.all

    5.times do
      @employees.each do |employee|
        shift = self.shifts.build(date: date, start_time: Time.new(1111, 1, 1, 8, 0, 0, "-01:00"), end_time: Time.new(1111, 1, 1, 16, 0, 0, "-01:00"), published: false)
        shift.employee = employee
        shift.save
      end
      date = date.next_day
    end
    self.end_date = date
  end
end
