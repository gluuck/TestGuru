# frozen_string_literal: true

class User < ApplicationRecord
  has_many :results
  has_many :tests , through: :results

  def find_by_level(level)
    Test.joins('JOIN results ON results.test_id = tests.id')
      .where(results: {user_id: id}, tests: { level: level })
  end
end
