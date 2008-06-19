module Reddit
  
  # The main reddit or a subreddit.
  class Reddit < ResourceList
    
    # Initialize the reddit.  If no name is specified, the reddit will be the main reddit.
    def initialize(name = nil)
      @name = name
      @url = @name.nil? ? BASE_URL : SUBREDDIT_URL.gsub('[subreddit]', @name)
    end
    
    def hot
      articles 'hot'
    end
    
    def top
      articles 'top'
    end
    
    def new
      articles 'new'
    end
    
    def controversial
      articles 'controversial'
    end
    
    # Returns the articles found in this reddit.
    def articles(page = 'hot')
      resources = get_resources("#{@url}#{page}/")
      
      articles = []
      
      resources.each do |article|
        articles << Article.new(article['data'])
      end
      
      return articles
    end
  end
end