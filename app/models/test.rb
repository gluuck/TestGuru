class Test < ApplicationRecord
	has_many :users, through: :results
	
	def self.test_titles(title)
		joins('JOIN categories ON categories.id = tests.category_id')
			    .where(categories:{title: title}).order(title: :desc).pluck(:title)
	end
end
