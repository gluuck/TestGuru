# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, ggreater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, greater_than: 0 }

  scope :lite, -> {where(level: 0..1)}
  scope :medium, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}

  scope :test_titles, ->(title){
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
  }

  def self.find_titles(title)
    test_titles(title).pluck(:title)
  end
end
