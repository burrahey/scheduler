class Schedule < ApplicationRecord
  has_many :shifts
  has_many :employees, through: :shifts
end
