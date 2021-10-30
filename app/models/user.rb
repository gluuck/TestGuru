# frozen_string_literal: true

class User < ApplicationRecord

  def find_by_level(level)
    Test.joins('JOIN results ON results.test_id = tests.id')
      .where(tests: { level: level })
  end
end
