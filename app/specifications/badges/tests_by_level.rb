module Badges
  class TestsByLevel < BadgeRuleSpecification

    def is_result?
      level = @value.to_i
      Result.where(user: @result.user).includes(:test).
            where(test: {level: level}).count == 
            Test.where(level: level).count
    end
  end 
end
