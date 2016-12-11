# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Category.create! id: 1, name: "服务器", parent: 0
Category.create! id: 2, name: "存储器",      parent: 0
Category.create! id: 3, name: "交换机",      parent: 0
Category.create! id: 4, name: "V3000",      parent: 1
Category.create! id: 5, name: "V5030",      parent: 1
Category.create! id: 6, name: "V7000",      parent: 1
Category.create! id: 7, name: "G4030",      parent: 2
Category.create! id: 8, name: "G5330",      parent: 2
Category.create! id: 9, name: "G7200",      parent: 2
Category.create! id: 10, name: "M3030",      parent: 3
Category.create! id: 11, name: "M5331",      parent: 3
Category.create! id: 12, name: "M7020",      parent: 3

User.destroy_all
User.create! id: 1, name: "normal", password: "123456", level: "NORMAL"
User.create! id: 2, name: "vip", password: "123456", level: "VIP"
User.create! id: 3, name: "admin", password: "123456", level: "ADMIN"

Auth.destroy_all
Auth.create! id: 1, email: "admin@admin.com", password: '123456'
