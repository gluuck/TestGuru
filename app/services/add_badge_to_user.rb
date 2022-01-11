class AddBadgeToUser
  attr_reader :result

  RULE = {
    on_the_first_attempt: Badges::OnTheFirstAttempt,
    tests_by_category: Badges::TestsByCategory,
    tests_by_level: Badges::TestsByLevel    
  }.freeze

  def initialize(result)
    @result = result
  end

  def call
    Badge.select do |badge|
      rule = RULE[badge.rule.to_sym].new(result: result, badge: badge)
      push_badge(badge) if rule.win_result?  
    end
  end

  private

  def push_badge(badge)
    result.user.badges << Badge.find_by(rule: badge.rule)
  end 
end
