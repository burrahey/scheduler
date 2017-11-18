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
    @employees = Employee.all
    date = start_date
    7.times do
      if date.on_weekday?
        @employees.each do |employee|
          shift = self.shifts.build(date: date, start_time: Time.new(1111, 1, 1, 8, 0, 0, "-01:00"), end_time: Time.new(1111, 1, 1, 16, 0, 0, "-01:00"), published: false)
          shift.employee = employee
          shift.save
        end
      end
      date = date.next_day
    end
    self.end_date = date
  end

end
