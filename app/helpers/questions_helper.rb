module QuestionsHelper
  
  def current_year
    Time.current.year
  end

  def github_url(name,repo)
    link_to 'TestGuru', "https://github.com/#{name}/#{repo}",target: :_blank
  end

  def question_header(question)
    question.persisted? ? "#{t('.edit')} #{question.test.title} #{t('.question')} " : "#{t('.create_new')} #{t('.question')}  #{@test.title}"
  end
end
