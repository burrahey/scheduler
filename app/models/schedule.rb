class Schedule < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :employees, through: :shifts

  def self.check_date_validity(date)
    if date.empty?
      return "Please enter a valid date"
    elsif Schedule.find_by_any_date(date)
      return "A schedule already exists for this time"
    else
      return nil
    end
  end

  def self.find_by_any_date(date)
    date = date.try(:to_datetime).try(:beginning_of_week)
    Schedule.find_by(start_date: date)
  end

  def build_schedule
    self.start_date  = self.start_date.beginning_of_week
    self.assign_shifts
  end

  def publish_and_save
    self.published = true
    self.shifts.each do |shift|
      shift.update(published: true)
    end
    self.save
  end

  def assign_shifts
    date = self.start_date
    @employees = Employee.all
    (0..4).each do |i|
      @employees.each do |employee|
        shift = self.shifts.build(date: date + i.day, start_time: DateTime.new(1111, 1, 1, 8, 0, 0, "-01:00"), end_time: DateTime.new(1111, 1, 1, 16, 0, 0, "-01:00"), published: false)
        shift.employee = employee
        shift.save
      end
    end

    self.end_date = date + 4.day
  end
end
