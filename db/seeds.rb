# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Category.create! id: 1, name: "热门手机", parent: 0
Category.create! id: 2, name: "小米",     parent: 1
Category.create! id: 3, name: "iPhone",     parent: 1
Category.create! id: 4, name: "魅族",      parent: 1
Category.create! id: 5, name: "荣耀",      parent: 1
Category.create! id: 6, name: "OPPO",      parent: 1
Category.create! id: 7, name: "NOKIA",      parent: 1
Category.create! id: 8, name: "华为",      parent: 1
Category.create! id: 9, name: "电脑整机",      parent: 0
Category.create! id: 10, name: "笔记本",      parent: 9
Category.create! id: 11, name: "台式机",      parent: 9
Category.create! id: 12, name: "平板电脑",      parent: 9
Category.create! id: 13, name: "一体机",      parent: 9
Category.create! id: 14, name: "DIY",      parent: 9
Category.create! id: 15, name: "智能设备",      parent: 0
Category.create! id: 16, name: "智能手表",      parent: 15
Category.create! id: 17, name: "智能眼睛",      parent: 15
Category.create! id: 18, name: "智能机器人",      parent: 15
Category.create! id: 19, name: "VR眼镜",      parent: 15
Category.create! id: 20, name: "Nikon",      parent: 0
Category.create! id: 21, name: "服务器",      parent: 0

Product.destroy_all
Product.create! id: 1, category_id: 4, name: "x3850x6服务器", image_url: "x3850x6.jpg", price: 62000.00, active: true, thumb: ["x3850x6.jpg"], pictures: ["x3850x6.jpg", "2.jpg", "3.jpg"], description: 'Lenovo System x3850 X6, 2x Intel Xeon Processor E7-4830 v3 12C 2.1GHz 115W 30M TruDDR4 1866，标配2块内存板48个DIMM，32GB(4x8GB) 2133MHz DDR4内存，标配8个 2.5" SAS热插拔硬盘槽位，标配M5210 支持RAID0、1、10 可选缓存或Flash保护，主机带4口个千兆以太网卡，标配2个900W热插拔电源(带2根PDU电源线), 4U机架式，无光驱。三年7*24*4有限保修'
Product.create! id: 2, category_id: 5, name: "7158IY5", image_url: "7158IY5.jpg", price: 12000.00, active: true, thumb: ["7158IY5.jpg"], pictures: ["7158IY5.jpg", "2.jpg", "3.jpg"], description: 'X3630M4 Xeon E5-2407V2 4C 2.4GHz/2*8GB DDR3/8*0GB 3.5"SAS/RAID-M5110/无光/2*1000M/550W/2U'
Product.create! id: 3, category_id: 6, name: "7158IY1", image_url: "7158IY1.jpg", price: 11500.00, active: true, thumb: ["7158IY1.jpg"], pictures: ["7158IY1.jpg", "2.jpg", "3.jpg"], description: 'X3630M4 Xeon E5-2407V2 4C 2.4GHz/2*8GB DDR3/8*0GB 3.5"SAS/RAID-M1115/无光/2*1000M/550W/2U'
Product.create! id: 4, category_id: 7, name: "69Y1194-1", image_url: "69Y1194-1.jpg", price: 3.08, active: true, thumb: ["69Y1194-1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "haha"
Product.create! id: 5, category_id: 8, name: "32R1860", image_url: "32R1860.jpg", price: 9573.00, active: true, thumb: ["32R1860.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is a Nikon WU 1b camera"
Product.create! id: 6, category_id: 3, name: "X3750M4拆机套件", image_url: "X3750M4.jpg", price: 200.00, active: true, thumb: ["X3750M4.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is V3 camera"
Product.create! id: 7, category_id: 2, name: "59Y6213-1", image_url: "59Y6213-1.jpg", price: 500.00, active: true, thumb: ["59y6213-1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is J4 camera"
Product.create! id: 8, category_id: 3, name: "38M2897-1", image_url: "38M2897-1.jpg", price: 1.00, active: true, thumb: ["38M2897-1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AF-5"
Product.create! id: 9, category_id: 6, name: "联想的光纤线", image_url: "guangxian.jpg", price: 165.00, active: true, thumb: ["guangxian.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
Product.create! id: 10, category_id: 5, name: "81Y9690", image_url: "81Y9690.jpg", price: 1651.06, active: true, thumb: ["81Y9690.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
Product.create! id: 11, category_id: 4, name: "00D5036-1 8GB(1x8GB, 1Rx4, 1.35v)", image_url: "00D5036-1.jpg", price: 450.00, active: true, thumb: ["00D5036.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
Product.create! id: 12, category_id: 7, name: "8852-5TC", image_url: "8852-5TC.jpg", price: 26350.00, active: true, thumb: ["8852-5TC.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
Product.create! id: 13, category_id: 8, name: "42D0485-1", image_url: "42D0485-1.jpg", price: 2100.00, active: true, thumb: ["42D0485-1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
Product.create! id: 14, category_id: 6, name: "46W0672-1", image_url: "46W0672-1.jpg", price: 700.00, active: true, thumb: ["46W0672-1.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
Product.create! id: 15, category_id: 4, name: "46M0902", image_url: "46M0902.jpg", price: 300.00, active: true, thumb: ["46M0902.jpg"], pictures: ["1.jpg", "2.jpg", "3.jpg"], description: "This is AW1"
(1..100).each do |i|
  Product.create! id: 15+i, category_id: i%18+1, name: "46M0902 DIY #{ i }", image_url: "46M0902.jpg", price: 712.23+i, active: true, thumb: ["#{ i%9+1 }.jpg"], pictures: ["#{ (i+1)%9+1 }.jpg", "#{ (i+2)%9+1 }.jpg", "#{ (i+3)%9+1 }.jpg"], description: "This is a Nikon camera"
end

User.destroy_all
User.create! id: 1, name: "normal", password: "123456", level: "NORMAL"
User.create! id: 2, name: "vip", password: "123456", level: "VIP"
User.create! id: 3, name: "admin", password: "123456", level: "ADMIN"

StockKeepingUnit.destroy_all
StockKeepingUnit.create! id: 1, product_id: 1, inventory_count: 9, product_type: "X3850X6", prices: {"normal": 62000, "VIP": 62000, "other": 62000}, dimensions: {"供应商": "北京华夏盈远科技有限公司", "联系人": "崔志洋", "联系方式": "18001305657"}
StockKeepingUnit.create! id: 2, product_id: 2, inventory_count: 6, product_type: "7158IY5", prices: {"normal": 12000, "VIP": 12000, "other": 12000}, dimensions: {"供应商": "上海祺冠系统集成有限公司", "联系人": "李坤", "联系方式": "13801991175"}
StockKeepingUnit.create! id: 3, product_id: 2, inventory_count: 22, product_type: "7158IY1", prices: {"normal": 11500, "VIP": 11500, "other": 11500}, dimensions: {"供应商": "上海祺冠系统集成有限公司", "联系人": "李坤", "联系方式": "13801991175"}
StockKeepingUnit.create! id: 4, product_id: 4, inventory_count: 130, product_type: "118", prices: {"normal": 120, "VIP": 66, "other": 9}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 5, product_id: 5, inventory_count: 70, product_type: "228", prices: {"normal": 140, "VIP": 98, "other": 19}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 6, product_id: 6, inventory_count: 30, product_type: "338", prices: {"normal": 160, "VIP": 89, "other": 89}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 7, product_id: 6, inventory_count: 50, product_type: "448", prices: {"normal": 170, "VIP": 109, "other": 39}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 8, product_id: 1, inventory_count: 167, product_type: "348", prices: {"normal": 123, "VIP": 99, "other": 39}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 9, product_id: 2, inventory_count: 23, product_type: "128", prices: {"normal": 132, "VIP": 88, "other": 49}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 10, product_id: 3, inventory_count: 1900, product_type: "548", prices: {"normal": 89, "VIP": 77, "other": 59}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 11, product_id: 4, inventory_count: 12, product_type: "668", prices: {"normal": 134, "VIP": 87, "other": 69}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
StockKeepingUnit.create! id: 12, product_id: 5, inventory_count: 10, product_type: "778", prices: {"normal": 312, "VIP": 86, "other": 79}, dimensions: {"处理器": "英特尔@至强R处理器E5-2690 v4 1.7GHz", "Cache": "20MB", "网卡": "板载双口千兆以太网络适配器，可选PIC-e双口10Gb网络适配器或双口16Gb光纤通道卡", "cpu": "i5", "color": "red"}
(1..100).each do |i|
  StockKeepingUnit.create! id: 12+i, product_id: 6+i, inventory_count: 19, product_type: "", prices: {"normal": 62000, "VIP": 62000, "other": 62000}, dimensions: {"供应商": "北京华夏盈远科技有限公司", "联系人": "崔志洋", "联系方式": "18001305657"}
end
