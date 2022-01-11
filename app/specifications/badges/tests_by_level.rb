module Badges
  class TestsByLevel < BadgeRuleSpecification
    def win_result?
      result_request = Result.includes(:test).where(user: @result.user).
                              where(test: {level: @badge.parameter.to_i}).count
      test_request = Test.where(level: @badge.parameter.to_i).count

      result_request == test_request
    end
  end
end 