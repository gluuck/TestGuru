module Badges
  class OnTheFirstAttempt < BadgeRuleSpecification

    def is_result?
      title = @value
      Result.includes(:test).where(user: @result.user, test: {title: title}).count == 1
    end
  end
end
