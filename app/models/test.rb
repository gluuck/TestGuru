# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true }, uniqueness: true

  scope :complexity, -> (level) {
    find = ->{where(level: level)}
    case level
    when (0..1)
      find.call
    when (2..4)
      find.call
    when (5..Float::INFINITY)
      find.call
    end
  }

  scope :test_titles, ->(title){
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)      
  }
end
