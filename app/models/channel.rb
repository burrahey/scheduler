class Channel < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :shifts

end
