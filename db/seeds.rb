# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Setup Admin
admin = User.create(email: 'admin@admin.com', password: 'asdasdasd', password_confirmation: 'asdasdasd', role: 0)


Contestant.create([
  { first_name: 'Emma', middle_name: 'Grace', last_name: 'Smith', age: 25, address: '123 Main St.', user_id: admin.id },
  { first_name: 'Olivia', middle_name: 'Rose', last_name: 'Johnson', age: 30, address: '456 Oak Ave.', user_id: admin.id },
  { first_name: 'Ava', middle_name: 'Marie', last_name: 'Williams', age: 28, address: '789 Elm St.', user_id: admin.id },
  { first_name: 'Sophia', middle_name: 'Ann', last_name: 'Brown', age: 27, address: '321 Maple Rd.', user_id: admin.id },
  { first_name: 'Isabella', middle_name: 'Lynn', last_name: 'Davis', age: 26, address: '654 Pine St.', user_id: admin.id }
])
