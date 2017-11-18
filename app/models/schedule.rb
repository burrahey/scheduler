class Schedule < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :employees, through: :shifts

  def build_schedule
    @employees = Employee.all
    date = start_date

    7.times do
      if date.on_weekday?
        @employees.each do |employee|
          #if they don't already have a shift
          #for each employee, build a for the schedule that day: 9-5pm
          #save shift if possible
        end
      else
        date = date.next_day
      end
    end

    self.end_date = date
    self.savve

    #set end date
    #save the schedule and shifts
  end

end
