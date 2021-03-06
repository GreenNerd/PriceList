# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Category.create! id: 1, name: "电子产品", parent: 0
Category.create! id: 2, name: "电视",     parent: 1
Category.create! id: 3, name: "TUBE",     parent: 2
Category.create! id: 4, name: "LCD",      parent: 2
Category.create! id: 5, name: "PLASMA",      parent: 2
Category.create! id: 6, name: "PORTABLE ELECTRONICS",      parent: 1
Category.create! id: 7, name: "MP3 PLAYERS",      parent: 6
Category.create! id: 8, name: "FLASH",      parent: 7
Category.create! id: 9, name: "CD PLAYERS",      parent: 6
Category.create! id: 10, name: "2 WAY RADIOS",      parent: 6

Product.destroy_all
Product.create! id: 1, category_id: 4, name: "Banana", image_url: "1.png", price: 1.11, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 2, category_id: 5, name: "Alalaa", image_url: "2.png", price: 2.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 3, category_id: 6, name: "Cxcxcx", image_url: "3.png", price: 3.33, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 4, category_id: 7, name: "Alalab", image_url: "2.png", price: 3.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 5, category_id: 8, name: "Alalac", image_url: "2.png", price: 4.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 6, category_id: 9, name: "Alalae", image_url: "2.png", price: 5.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 7, category_id: 9, name: "Alalad", image_url: "2.png", price: 6.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 8, category_id: 7, name: "劳斯劳斯", image_url: "1.png", price: 423432.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 9, category_id: 6, name: "Dsfads", image_url: "2.png", price: 123123.2, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
Product.create! id: 10, category_id: 5, name: "Balalala", image_url: "2.png", price: 8989.22, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
(1..100).each do |i|
  Product.create! id: 10+i, category_id: i%9+1, name: "特拉斯", image_url: "3.png", price: 9.22+i, active: true, thumb: ["1.png"], pictures: ["1.png", "2.png", "3.png"], description: "haha"
end

User.destroy_all
User.create! id: 1, name: "normal", password: "123456", level: "NORMAL"
User.create! id: 2, name: "vip", password: "123456", level: "VIP"
User.create! id: 3, name: "admin", password: "123456", level: "ADMIN"

StockKeepingUnit.destroy_all
StockKeepingUnit.create! id: 1, product_id: 1, inventory_count: 100, product_type: "008", prices: {"normal": 100, "VIP": 66, "other": 99}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 2, product_id: 2, inventory_count: 10, product_type: "018", prices: {"normal": 10, "VIP": 6, "other": 9}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 3, product_id: 3, inventory_count: 45, product_type: "108", prices: {"normal": 88, "VIP": 36, "other": 19}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 4, product_id: 4, inventory_count: 130, product_type: "118", prices: {"normal": 120, "VIP": 66, "other": 9}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 5, product_id: 5, inventory_count: 70, product_type: "228", prices: {"normal": 140, "VIP": 98, "other": 19}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 6, product_id: 6, inventory_count: 30, product_type: "338", prices: {"normal": 160, "VIP": 89, "other": 89}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 7, product_id: 7, inventory_count: 50, product_type: "448", prices: {"normal": 170, "VIP": 109, "other": 39}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 8, product_id: 1, inventory_count: 167, product_type: "348", prices: {"normal": 123, "VIP": 99, "other": 39}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 9, product_id: 2, inventory_count: 23, product_type: "128", prices: {"normal": 132, "VIP": 88, "other": 49}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 10, product_id: 3, inventory_count: 1900, product_type: "548", prices: {"normal": 89, "VIP": 77, "other": 59}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 11, product_id: 4, inventory_count: 12, product_type: "668", prices: {"normal": 134, "VIP": 87, "other": 69}, dimensions: {"cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 12, product_id: 5, inventory_count: 10, product_type: "778", prices: {"normal": 312, "VIP": 86, "other": 79}, dimensions: {"cpu": "i5", "color": "red"}
