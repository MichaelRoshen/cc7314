class Building < ActiveRecord::Base
  belongs_to :building_type
  has_many :rooms
  belongs_to :estate
end
