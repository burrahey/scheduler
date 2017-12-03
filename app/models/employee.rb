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
  has_many :employee_preferences
  has_many :preferences, through: :employee_preferences

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

  def preferences_attributes=(preferences_attributes)
  preferences_attributes.values.each do |preference_attribute|
    preference = Preference.find_by(day: preference_attribute[:day]) || Preference.create(preference_attribute)

    if preference.valid? && !self.preferences.include?(preference)
      self.preferences << preference
    end
  end
end


end
