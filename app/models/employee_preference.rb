class EmployeePreference < ApplicationRecord
  belongs_to :preference
  belongs_to :employee
end
