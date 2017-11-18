class Schedule < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :employees, through: :shifts

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
