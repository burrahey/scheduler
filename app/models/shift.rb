class Shift < ApplicationRecord
  belongs_to :channel
  belongs_to :employee
  belongs_to :schedule
end
