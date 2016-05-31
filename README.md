**Gentelella On Rails**
---------------------------
Rails 4 implementation of the awesome [Gentelella](https://github.com/puikinsh/gentelella) Bootstrap admin template.

Setup:
 1. Clone this repo :  git clone
    https://github.com/iogbole/gentelella_on_rails.git

 2. cd gentelella_on_rails

 3. npm install -g bower

 4. bower install

 5. bundle install
 
 6. rake rails:update:bin
 
 7. rails s

That's it!

Navigate to   http://localhost:3000/plainpage/index


用户 or 业主：
User: name, role, id_card, age, phone, email, address, cell_gate(单元门), floor(层), house_num(门牌号), room_type_id, building_id, room_in_date(入住时间), area(建筑面积)

rails g scaffold User name:string role:string id_card:string age:integer cell_gate:integer floor:integer house_num:integer phone:string email:string address:string building_id:integer room_type_id:integer room_in_date:date area:float

小区：
  Estate： name, leader(负责人), area(占地面积), position(位置), price(均价)

rails g scaffold Estate name:string area:float postions:string price:integer

楼房：
  Building：num(编号), name(A，B区), face(朝向), floor_num(楼层) , cell_gate_num(单元门数), door_num(一梯几户), building_type_id

rails g scaffold building num:integer name:string face:string floor_num:integer building_type_id:integer door_num:integer estate_id:integer cell_gate_num:integer

楼房类型：(多层，别墅，高层)
  BuildingType: name

rails g scaffold building_type name:string

房间：
  Room: cell_gate(单元门), floor(层), house_num(门牌号), room_type_id, building_id, room_in_date(入住时间), area(建筑面积)

rails g scaffold room cell_gate:integer floor:integer house_num:string room_type_id:integer building_id:integer room_in_date:date area:integer

房间类型： 
  RoomType: name

rails g scaffold room_type name:string

收费项目：
  ChargeType: name

rails g scaffold charge_type name:string

收费：
  Charge: name, charge_type_id, price, room_id, user_id

rails g scaffold charge name:string charge_type_id:integer price:float room_id:integer user_id:integer

投诉：
  Complaint: user_id, state, content

rails g scaffold complaint content:text state:string user_id:integer

物品采购：
  Product： name, count, price, total_price, product_type_id, note

rails g scaffold product name:string count:integer price:float total_price:float product_type_id:integer note:string

采购类型
	ProductType： name

rails g scaffold product_type name:string

员工工资：
salary ： price(工资) bonus(奖金) grant_date(发放日期)

rails g salary user_id:integer price:float bonus:float grant_date:date


物业报修：
repair： summary(描述) send_date(报修时间) repair_date(修复时间) repairman(维修人员) note(备注)
rails g scaffold repair  phone:string address:string send_date:date repair_date:date repairman:string summary:text note:text

设备维修：

领取钥匙记录
room_id, user_id, date, note


