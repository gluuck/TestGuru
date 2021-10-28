class Test < ApplicationRecord

	def self.test_titles(title)
		Test.where(title: Category.find_by(title: title).title).pluck(:title).order(title: :desc)
	end
end
