class BadgeFactory
  attr_reader :result

  def initialize(result)
    @result = result
  end  

  def build_badge
    find_rule
    result.user.badges << Badge.find_by(rule: @rule) unless @rule.nil?    
  end  

  private

  def find_rule
    if tests_by_category
      @rule = 'tests_by_category'
    elsif on_the_first_attempt
      @rule = 'on_the_first_attempt'
    elsif tests_by_level
      @rule = 'tests_by_level'    
    end
  end  

  def tests_by_category
    category_title = Category.where(title: Test.find_by(id: result.test).category.title)

    result_request = Result.includes(:test).where(user: result.user).
                            where(test: {category: category_title}).count  
    test_request = Test.where(category: category_title).count

    result_request == test_request
  end  

  def tests_by_level
    result_request = Result.includes(:test).where(user: result.user).
                            where(test: {level: result.test.level}).count 
    test_request = Test.where(level: result.test.level).count

    result_request == test_request
  end

  def on_the_first_attempt
    Result.where(user: result.user, test: result.test).count <= 1
  end
end
