module Badges
  class TestsByCategory < BadgeRuleSpecification
    def win_result?
      category = Category.find_by(id: @badge.parameter.to_i)

      result_request = Result.includes(:test).where(user: @result.user).
                              where(test: {category: category}).count
      test_request = Test.where(category: category).count

      result_request == test_request
    end
  end
end
