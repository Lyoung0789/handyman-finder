# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(first_name: "Jack", last_name: "Jones", username: "JJ", email:"jackjones@test.com", password: "jack", phone_number: "555-555-5555")
technician = Technician.create(name: "Joe_tech", phone_number:"111-111-1111", rating: 5, category: "Appliance")
app = Appointment.create(date: DateTime.current, issue:"Fridge is broken", technician_id: 1, user_id: 1)
