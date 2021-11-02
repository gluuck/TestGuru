# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  
  has_many :questions, dependent: :destroy
  has_many :results
  has_many :users, through: :results

  def self.test_titles(title)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)      
  end
end
