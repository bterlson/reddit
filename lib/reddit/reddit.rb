module Reddit
  
  # The main reddit or a subreddit.
  class Reddit < ResourceList
    
    # Initialize the reddit.  If no name is specified, the reddit will be the main reddit.
    def initialize(name = nil)
      @name = name
      @url = @name.nil? ? BASE_URL : SUBREDDIT_URL.gsub('[subreddit]', @name)
    end
    
    # Returns the articles found in this reddit.
    def articles      
      resources = get_resources(@url)
      
      articles = []
      
      resources.each do |article|
        articles << Article.new(article['data'])
      end
      
      return articles
    end
  end
end