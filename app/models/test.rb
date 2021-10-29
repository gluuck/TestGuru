class Test < ApplicationRecord
	belongs_to :category

	def self.test_titles(title)
		joins(:category).where(categories: {title: title}).order(title: :DESC).pluck(:title)
	end
end
