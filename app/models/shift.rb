class Shift < ApplicationRecord
  validates :start_time, :end_time, :date, presence: true
  validates :employee, uniqueness: { scope: :date, message: "already has a shift that day" }
  validate :start_time_before_end_time
  belongs_to :employee, required: false
  belongs_to :schedule

  def self.find_between_dates(date_1, date_2)
    self.where("date BETWEEN ? and ?", date_1, date_2)
  end

  def start_time_before_end_time
    if start_time && end_time && start_time > end_time
      errors.add(:start_time, "must be before end time")
      errors.add(:end_time, "must be after start time")
    end
  end

  def self.build_and_assign_schedule(shift_params, employee_id=null)
    employee = Employee.find_by(id: employee_id)

    if employee
      shift = employee.shifts.build(shift_params)
    else
      shift = self.new(shift_params)
    end

    shift.schedule = Schedule.find_by_any_date(shift.date)

    return shift
  end

end
