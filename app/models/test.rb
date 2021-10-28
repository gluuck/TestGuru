class Test < ApplicationRecord

	def self.test_titles(title)
		Test.order(title: :desc).where(title: Category.find_by(title: title).title).pluck(:title)
	end
end
