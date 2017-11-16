class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  # validates :first_name, :last_name, :role, :date_hired, presence: true
  # enum role: [:associate, :supervisor]
  # scope :associates, -> { where(role: 'associate') }
  # has_many :shifts
  # has_many :schedules, through: :shifts


end
