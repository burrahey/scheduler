class Shift < ApplicationRecord
  validates :start_time, :end_time, :date, presence: true
  validates :employee, uniqueness: { scope: :date, message: "already has a shift that day" }
  belongs_to :employee, required: false
  belongs_to :schedule, required: false

end
