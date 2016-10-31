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
Product.create! id: 1, category_id: 4, name: "Nikon D5300", image_url: "1.jpg", price: 661.11, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is a shopping cart"
Product.create! id: 2, category_id: 5, name: "Nikon Coolpix", image_url: "2.jpg", price: 662.22, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "It's Nikon"
Product.create! id: 3, category_id: 6, name: "Nikon WP-N3", image_url: "3.jpg", price: 663.33, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "Just a camera"
Product.create! id: 4, category_id: 7, name: "Nikkor 10-30 VR", image_url: "4.jpg", price: 623.22, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "haha"
Product.create! id: 5, category_id: 8, name: "Nikon WU 1b", image_url: "5.jpg", price: 664.22, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is a Nikon WU 1b camera"
Product.create! id: 6, category_id: 9, name: "Nikon V3", image_url: "6.jpg", price: 665.22, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is V3 camera"
Product.create! id: 7, category_id: 9, name: "Nikon J4", image_url: "7.jpg", price: 666.22, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is J4 camera"
Product.create! id: 8, category_id: 7, name: "Nikkor AF-S", image_url: "8.jpg", price: 423.22, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AF-5"
Product.create! id: 9, category_id: 6, name: "Nikon AW1", image_url: "9.jpg", price: 123.2, active: true, thumb: ["1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
(1..100).each do |i|
  Product.create! id: 9+i, category_id: i%9+1, name: "尼康 RMB #{ i }", image_url: "#{ i%9+1 }.jpg", price: 712.23+i, active: true, thumb: ["#{ i%9+1 }.jpg"], pictures: ["#{ (i+1)%9+1 }.jpg", "#{ (i+2)%9+1 }.jpg", "#{ (i+3)%9+1 }.jpg"], description: "This is a Nikon camera"
end

User.destroy_all
User.create! id: 1, name: "normal", password: "123456", level: "NORMAL"
User.create! id: 2, name: "vip", password: "123456", level: "VIP"
User.create! id: 3, name: "admin", password: "123456", level: "ADMIN"

StockKeepingUnit.destroy_all
StockKeepingUnit.create! id: 1, product_id: 1, inventory_count: 100, product_type: "008", prices: {"normal": 100, "VIP": 66, "other": 99}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 2, product_id: 2, inventory_count: 10, product_type: "018", prices: {"normal": 10, "VIP": 6, "other": 9}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 3, product_id: 3, inventory_count: 45, product_type: "108", prices: {"normal": 88, "VIP": 36, "other": 19}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 4, product_id: 4, inventory_count: 130, product_type: "118", prices: {"normal": 120, "VIP": 66, "other": 9}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 5, product_id: 5, inventory_count: 70, product_type: "228", prices: {"normal": 140, "VIP": 98, "other": 19}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 6, product_id: 6, inventory_count: 30, product_type: "338", prices: {"normal": 160, "VIP": 89, "other": 89}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 7, product_id: 7, inventory_count: 50, product_type: "448", prices: {"normal": 170, "VIP": 109, "other": 39}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 8, product_id: 1, inventory_count: 167, product_type: "348", prices: {"normal": 123, "VIP": 99, "other": 39}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 9, product_id: 2, inventory_count: 23, product_type: "128", prices: {"normal": 132, "VIP": 88, "other": 49}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 10, product_id: 3, inventory_count: 1900, product_type: "548", prices: {"normal": 89, "VIP": 77, "other": 59}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 11, product_id: 4, inventory_count: 12, product_type: "668", prices: {"normal": 134, "VIP": 87, "other": 69}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 12, product_id: 5, inventory_count: 10, product_type: "778", prices: {"normal": 312, "VIP": 86, "other": 79}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
