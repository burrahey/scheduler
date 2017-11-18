class Shift < ApplicationRecord
  validates :start_time, :end_time, :date, presence: true
  validates :employee, uniqueness: { scope: :date, message: "already has a shift that day" }
  validate :start_time_before_end_time
  validate :shift_belongs_to_an_existing_schedule
  belongs_to :employee, required: false
  belongs_to :schedule, required: false

  def start_time_before_end_time
    if start_time && end_time && start_time > end_time
      errors.add(:start_time, "must be before end time")
      errors.add(:end_time, "must be after start time")
    end
  end

  def shift_belongs_to_an_existing_schedule
    if date && !Schedule.find_by_start_date(date)
      errors.add(:date, "doesn't have an existing schedule. Try adding a schedule first")
    end
  end

end
