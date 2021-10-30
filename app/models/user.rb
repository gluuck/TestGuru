# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests, through: :results

  def find_by_level(level)
    Test.joins('JOIN results ON results.test_id = tests.id').where(tests: { level: level }).pluck(:title)
  end
end
