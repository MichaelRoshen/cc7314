class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ALLOW_LOGIN_CHARS_REGEXP = /\A[A-Za-z0-9\-\_\.]+\z/
  
  validates :login, format: { with: ALLOW_LOGIN_CHARS_REGEXP, message: '只允许数字、大小写字母和下划线' },
                    length: { in: 3..20 },
                    presence: true,
                    uniqueness: { case_sensitive: true }

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
