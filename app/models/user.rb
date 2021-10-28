class User < ApplicationRecord

	def find_by_level(level)
		@user_tests = Test.where(level: level)
	end
end
