class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :date, :start_time, :end_time, :employee_id, :schedule_id, :published
  belongs_to :employee
end
