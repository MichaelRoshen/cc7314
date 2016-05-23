class User < ActiveRecord::Base
  has_many :rooms
  belongs_to :building
  belongs_to :estate
end
