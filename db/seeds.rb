# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'Adam@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Ewa@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'reader@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'writer@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'librarian@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Jon@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Lagertha@example.com', password: 'password', password_confirmation: 'password')
