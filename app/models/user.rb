class User < ActiveRecord::Base
  belongs_to :building
  belongs_to :room_type
  has_many :charges
  has_many :salaries

  def demo_user_name
  	"user_#{self.cell_gate}-#{self.floor}0#{self.house_num}"
  end

  def room
  	"#{self.cell_gate}-#{self.floor}0#{self.house_num}"
  end

end
