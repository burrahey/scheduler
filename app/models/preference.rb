class Preference < ApplicationRecord
  enum day: { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6 }
  has_many :employee_preferences
  has_many :employees, through: :employee_preferences
  validates :desc, :day, presence: true

end
