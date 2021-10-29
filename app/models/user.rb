class User < ApplicationRecord
	has_many :tests

	def find_by_level(level)
		User.joins(:tests).where(tests: {level: level})
	end
end
