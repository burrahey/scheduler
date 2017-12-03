# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  Employee.create(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :password => Faker::Internet.password,
    :date_hired => DateTime.now,
    :role => 'associate'
    )
end

4.times do
  Employee.create(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :password => Faker::Internet.password,
    :date_hired => DateTime.now,
    :role => 'supervisor'
    )
end

Preference.create(
  :day => 'monday',
  :allow => false,
  :desc => "Can't work Mondays"
)

Preference.create(
  :day => 'tuesday',
  :allow => false,
  :desc => "Can't work Tuesdays"
)

Preference.create(
  :day => 'wednesday',
  :allow => false,
  :desc => "Can't work Wednesdays"
)
Preference.create(
  :day => 'thursday',
  :allow => false,
  :desc => "Can't work Thursdays"
)
Preference.create(
  :day => 'friday',
  :allow => false,
  :desc => "Can't work Fridays"
)
Preference.create(
  :day => 'saturday',
  :allow => false,
  :desc => "Can't work Saturdays"
)
Preference.create(
  :day => 'sunday',
  :allow => false,
  :desc => "Can't work Sundays"
)
