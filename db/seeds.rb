# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Product.create! id: 1, name: "Banana", image_url: "1.png", price: 1.11, active: true
Product.create! id: 2, name: "Alalaa", image_url: "2.png", price: 2.22, active: true
Product.create! id: 3, name: "Cxcxcx", image_url: "3.png", price: 3.33, active: true
Product.create! id: 4, name: "Alalab", image_url: "2.png", price: 3.22, active: true
Product.create! id: 5, name: "Alalac", image_url: "2.png", price: 4.22, active: true
Product.create! id: 6, name: "Alalae", image_url: "2.png", price: 5.22, active: true
Product.create! id: 7, name: "Alalad", image_url: "2.png", price: 6.22, active: true
Product.create! id: 8, name: "Alalaf", image_url: "2.png", price: 7.22, active: true
Product.create! id: 9, name: "Alalag", image_url: "2.png", price: 8.22, active: true
Product.create! id: 10, name: "Alalah", image_url: "2.png", price: 9.22, active: true
Product.create! id: 11, name: "Alalai", image_url: "2.png", price: 2.12, active: true
Product.create! id: 12, name: "Alalaj", image_url: "2.png", price: 2.32, active: true
Product.create! id: 13, name: "Alalak", image_url: "2.png", price: 2.42, active: true
Product.create! id: 14, name: "Alalal", image_url: "2.png", price: 2.52, active: true

User.delete_all
User.create! id: 1, name: "normal", password: "123456", level: "NORMAL"
User.create! id: 2, name: "vip", password: "123456", level: "VIP"
User.create! id: 3, name: "admin", password: "123456", level: "ADMIN"
