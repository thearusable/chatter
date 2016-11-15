# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', master_admin: true)
AdminUser.create!(email: 'moderator@example.com', password: 'password', password_confirmation: 'password')


User.create!(email: 'Adam@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Ewa@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'reader@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'writer@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'librarian@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Jon@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Lagertha@example.com', password: 'password', password_confirmation: 'password')
