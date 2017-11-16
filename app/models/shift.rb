class Shift < ApplicationRecord
  validates :start_date_time, :end_date_time, presence: true
  validates :employee, uniqueness: { scope: :start_date_time, message: "This employee already has a shift that day" }
  belongs_to :channel
  belongs_to :employee, required: false
  belongs_to :schedule, required: false
end
