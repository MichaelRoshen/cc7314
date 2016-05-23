class Building < ActiveRecord::Base
  has_many :building_types
  has_many :rooms
  belongs_to :estate
end
