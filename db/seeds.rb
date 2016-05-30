# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##clean

Estate.destroy_all
BuildingType.destroy_all
RoomType.destroy_all
Building.destroy_all
User.destroy_all
ChargeType.destroy_all
Charge.destroy_all

##创建项目
puts "创建项目..."
es = Estate.create({:name => "远洋香奈", :area => 20000, :position => "天津市武清区佛罗伦萨小镇", :price => 16000})

##创建楼层类型  房间类型
puts "创建楼层类型  房间类型..."
['多层','高层','别墅'].each{|name|BuildingType.create({:name => name})}
['一室一厅','两室一厅','三室一厅','两室两厅','三室两厅'].each{|name|RoomType.create({:name => name})}

building_type_ids = BuildingType.all.map(&:id)
room_type_ids = RoomType.all.map(&:id)

puts "创建楼宇..."
1.upto 10 do |i|
  attries = {:num => i, :name => "#{i}号楼", 
             :face => ["朝南","朝北","南北通透"].sample, 
             :floor_num => 18, :building_type_id => building_type_ids.sample,
             :estate_id => es.id, :cell_gate_num => 6, :door_num => 3}
  Building.create(attries)
end

##创建房间
puts "创建房间&业主..."
Building.all.each do |building|
  1.upto building.cell_gate_num do |gate|
    1.upto building.floor_num do |floor|
      1.upto building.door_num do |door|
         attries = {:cell_gate => gate, 
                    :floor => floor, :house_num => door, 
                    :room_type_id => room_type_ids.sample,
                    :building_id => building.id, :room_in_date => nil,
                    :area => rand(80..150).to_f
                  }
        User.create(attries)
      end
    end
  end
end

##办理入住
puts "办理入住中..."
User.all.sample(1000).each do |user|
  id_card = rand(10).hash.abs.to_s[0..17]
  date = (Date.today-rand(365*3)).to_s
  user.update_attributes({:name => user.demo_user_name, 
                          :age => rand(20..50), :id_card => id_card,
                          :phone => "15901552733", :email => "demo@163.com",
                          :role => "yezhu", :room_in_date => date})
end



##创建房间
puts "创建费用类型..."
['物业费','电梯费','水费','电费','燃气费','取暖费','装修垃圾清理费'].each do |name|
  ChargeType.create({:name => name})
end


##创建收费订单
puts "创建收费订单..."

User.where("room_in_date is not null").all.sample(1000).each do |user|
  ChargeType.all.sample(rand(20)).each do |charge_type|
    Charge.create({:name => charge_type.name, :charge_type_id => charge_type.id, :price => rand(600).to_f, :user_id => user.id})  
  end
end

##创建物业员工
puts "创建物业员工..."
1.upto(5) do |i|
id_card = rand(10).hash.abs.to_s[0..17]
User.create({:name => "物业员工#{i}", 
             :age => rand(20..50), :id_card => id_card,
             :phone => "15901552733", :email => "yuangong@163.com",
             :role => "yuangong"})
end


##创建采购类型
puts "创建采购类型..."
['保洁','安保','绿化','消防','设备'].each do |name|
  ProductType.create({:name => name})
end

##物业采购
puts "物业采购..."
1.upto 100 do |i|
  ProductType.all.sample(5).each do |type|
    product = Product.new({:name => "#{type.name}用品#{rand(2)}", :count => rand(1..10), :price => rand(1000).to_f, :note => "备注: 采购单位:xxx, 联系人: xxxx", :date => (Date.today-rand(30*3)).to_s, :product_type_id => type.id})
    product.total_price = product.count * product.price
    product.save
  end
end
