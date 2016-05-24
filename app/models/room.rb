class Room < ActiveRecord::Base
  belongs_to :user
  belongs_to :building
  belongs_to :room_type

  def room_num
  	"#{self.building.num}-#{self.cell_gate}-#{self.floor}#{self.house_num}"
  end
end
