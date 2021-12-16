class GistQuestionService
  
  def initialize(client = default_client)
    @client = client 
  end 

  Result = Struct.new(:html_url) do
    def success?
      !html_url.nil?
    end    
  end

  def call(question)
    @question = question
    @gist_result = @client.create_gist(gist_params)
    Result.new(html_url)
  end
  
  private

  def html_url
    @gist_result.html_url if @gist_result && @gist_result.html_url.present?
  end  

  def gist_params
    {
      description: "A question about #{@question.test.title} from TestGuru",
      files: {
        "test-guru-#{@question.body}.txt" => {
          content: gist_content
        }
      } 
    }
  end

  def gist_content
    [@question.body,*@question.answers.pluck(:body)].join("\n")
  end 

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end  
end
