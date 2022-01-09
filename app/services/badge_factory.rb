class BadgeServiseToUser
  attr_reader :result

  RULE = {
    test_by_category: Badges::TestsByCategory,
    test_by_level: Badges::TestsByLevel,
    on_the_first_atempt: Badges::OnTheFirstAttempt
  }
  def initialize(result)
    @result = result
  end

  def add_badge_to_user
    Badge.select do |badge|
      rule = RULE[badge.rule.to_sym].new(result: result)
      push_badge(badge) if rule.win_result?
    end
  end

  private

  def push_badge(badge)
    result.user.badges << badge
  end
  # def find_rule
  #   if tests_by_category
  #     @rule = 'tests_by_category'
  #   elsif on_the_first_attempt
  #     @rule = 'on_the_first_attempt'
  #   elsif tests_by_level
  #     @rule = 'tests_by_level'
  #   end
  # end
  #
  # def tests_by_category
  #   category_title = Category.where(title: Test.find_by(id: result.test).category.title)
  #
  #   result_request = Result.includes(:test).where(user: result.user).
  #                           where(test: {category: category_title}).count
  #   test_request = Test.where(category: category_title).count
  #
  #   result_request == test_request
  # end
  #
  # def tests_by_level
  #   result_request = Result.includes(:test).where(user: result.user).
  #                           where(test: {level: result.test.level}).count
  #   test_request = Test.where(level: result.test.level).count
  #
  #   result_request == test_request
  # end
  #
  # def on_the_first_attempt
  #   Result.where(user: result.user, test: result.test).count <= 1
  # end
end
