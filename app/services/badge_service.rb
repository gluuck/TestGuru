class BadgeService

  RULE = {
    tests_by_category: Badges::TestsByCategory,
    on_the_first_attempt: Badges::OnTheFirstAttempt,
    tests_by_level: Badges::TestsByLevel
  }.freeze

  def initialize(result)
    @result = result
  end
  
  def call
    Badge.select do |badge|
      @result.user.badges.push(badge) if RULE[badge.rule.to_sym].new(result: @result, value: badge.parameter).is_result?
    end
  end  
end
