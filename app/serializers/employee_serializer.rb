class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :date_hired, :email
  has_many :preferences
end
