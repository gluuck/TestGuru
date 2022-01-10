module Badges
  class OnTheFirstAttempt < BadgeRuleSpecification
    def win_result?
      Result.where(user: @result.user, test: @result.test).count == 1
    end
  end
end
