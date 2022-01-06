module Badges
  class TestsByCategory < BadgeRuleSpecification

    def is_result?
      title = @value
      Result.where(user: @result.user).includes(:test).
             where(test: {category: Category.where(title: title)}).count == 
             Test.where(category: Category.where(title: title)).count
    end   
  end
end
