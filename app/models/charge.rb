class Charge < ActiveRecord::Base
	belongs_to :user
	belongs_to :charge_type

	def charge_date
		self.created_at.strftime("%Y-%m-%d")
	end
end
