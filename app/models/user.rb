class User < ApplicationRecord

	def find_by_level(level)
		User.joins('JOIN tests ON test.user_id = user.id').where(levels: {level: level})
		#.user_id = users.id ON tests.level = ?', level)#.where(tests: {level: level})
	end
end
