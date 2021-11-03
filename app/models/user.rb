# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests , through: :results
  has_many :author_tests, foreign_key: :author_id, class_name: 'Test', dependent: :destroy

  def find_by_level(level)
    tests.where(level: level)
  end
end
