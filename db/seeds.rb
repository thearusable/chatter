# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'reader@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Adam@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Ewa@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'writer@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'librarian@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Jon@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'Lagertha@example.com', password: 'password', password_confirmation: 'password')

ChatRoom.create!(title: "Podroze", user_id: 1)
ChatRoom.create!(title: "Sport", user_id: 1)
ChatRoom.create!(title: "Polityka", user_id: 1)
ChatRoom.create!(title: "Muzyka", user_id: 1)
ChatRoom.create!(title: "Gry", user_id: 1)
ChatRoom.create!(title: "Technologia", user_id: 1)
ChatRoom.create!(title: "Nauka", user_id: 1)
ChatRoom.create!(title: "Kultura", user_id: 1)
ChatRoom.create!(title: "Rozne", user_id: 1)
ChatRoom.create!(title: "Nowe Osoby", user_id: 1)
ChatRoom.create!(title: "Gadzety", user_id: 1)
