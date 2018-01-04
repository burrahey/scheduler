class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :published, :start_date, :end_date
  has_many :shifts

end
