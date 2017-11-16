# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
phone = Channel.create(name: "Phone")
email = Channel.create(name: "Email")
chat = Channel.create(name: "Chat")
messaging = Channel.create(name: "Messaging")
pto = Channel.create(name: "PTO")
comp_day = Channel.create(name: "Comp Day")
supervisor = Channel.create(name: "Supervisor")

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
