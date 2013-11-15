class User < ActiveRecord::Base
	def self.current_user
		User.first
	end
end
