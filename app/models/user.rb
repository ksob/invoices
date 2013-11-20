class User < ActiveRecord::Base
	validates :name, presence: true

	def self.current_user
		User.first
	end
end
