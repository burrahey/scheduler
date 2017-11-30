class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, :last_name, :role, :date_hired, presence: true
  enum role: [:associate, :supervisor]
  scope :associates, -> { where(role: 'associate') }
  has_many :shifts, dependent: :destroy
  has_many :schedules, through: :shifts

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |employee|
      employee.email = auth.info.email
      employee.password = Devise.friendly_token[0,20]
      name = auth.info.name.split(" ")
      employee.first_name = name[0]
      employee.last_name = name[1]
      employee.role = 'associate'
      employee.date_hired = DateTime.now
    end
  end

  def self.new_from_params(employee_params)
    self.new.tap do |employee|
      employee.first_name = employee_params[:first_name]
      employee.last_name = employee_params[:last_name]
      employee.email = employee_params[:email]
      employee.date_hired = employee_params[:date_hired]
      employee.role = employee_params[:role]
      employee.password = employee_params[:password]
    end
  end

  def self.new_shift_from_params(shift_params)
    
  end

  def update_from_params(employee_params)
      self.first_name = employee_params[:first_name]
      self.last_name = employee_params[:last_name]
      self.email = employee_params[:email]
      self.date_hired = employee_params[:date_hired]
      self.role = employee_params[:role]
      self.password = employee_params[:password] if !employee_params[:password].blank?
      self
  end


end
