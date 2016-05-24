class User < ActiveRecord::Base
  has_one :room
  belongs_to :building
  belongs_to :estate
  has_many :charges
end
