module  Badges
  class TestsByCategory < Badge::BadgeRuleSpecification
    def win_result?
      category_title = Category.where(title: Test.find_by(id: @result.test).category.title)

      result_request = Result.includes(:test).where(user: @result.user).
                              where(test: {category: category_title}).count
      test_request = Test.where(category: category_title).count

      result_request == test_request
    end
  end

  class TestsByLevel < Badge::BadgeRuleSpecification
    def win_result?
      result_request = Result.includes(:test).where(user: @result.user).
                              where(test: {level: @result.test.level}).count
      test_request = Test.where(level: @result.test.level).count

      result_request == test_request
    end
  end

  class OnTheFirstAttempt < Badge::BadgeRuleSpecification
    def win_result?
      Result.where(user: @result.user, test: @result.test).count <= 1
    end
  end

  class BadgeRuleSpecification
    def initialize(result:)
      @result = result
    end
  end
end
