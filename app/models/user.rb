class User < ApplicationRecord
	has_many :tests, through: :results

	def find_by_level(level)
		Test.joins('JOIN users ON users.id = tests.user_id').where(tests: {level: level}).pluck(:title)
	end
end
