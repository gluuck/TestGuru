module QuestionsHelper

  def questions_count(test)
    test.questions.count
  end

  def time_now
    Time.now.year
  end

  def github_url(name,repo)
    link_to 'TestGuru', "https://github.com/#{name}/#{repo}"
  end

  def question_header(question)
    question.persisted? ? "Edit #{question.test.title} question " : "Create new  #{@test.title} quetion"
  end
end
