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
Room.destroy_all
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

##创建楼宇
# Building：num(编号), name(A，B区), face(朝向), floor_num(楼层) , cell_gate_num(单元门数), door_num(一梯几户), building_type_id

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
        id_card = rand(10).hash.abs.to_s[0..17]
        user = User.create({:name => "user_#{gate}-#{floor}0#{door}", :age => rand(20..50), :id_card => id_card, :estate_id => es.id, :building_id =>building.id })
        attries = {:cell_gate => gate, :floor => floor, :house_num => "0#{door}", :room_type_id => room_type_ids.sample,
                   :building_id => building.id, :room_in_date => (Date.today-rand(365*3)).to_s,
                   :area => rand(80..150).to_f, :user_id => user.id}
        Room.create(attries)
      end
    end
  end
end

##创建房间
puts "创建费用类型..."
['物业费','电梯费','水费','电费','燃气费','取暖费','装修垃圾清理费'].each do |name|
  ChargeType.create({:name => name})
end


##创建收费订单
puts "创建收费订单..."

Room.all.sample(1000).each do |room|
  ChargeType.all.sample(rand(5)).each do |charge_type|
    Charge.create({:name => charge_type.name, :charge_type_id => charge_type.id, :price => rand(600).to_f, :user_id => room.user.id})  
  end
end





