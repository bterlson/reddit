module Reddit
  
  # The main reddit or a subreddit.
  class Reddit < ResourceList
    
    # Initialize the reddit.  If no name is specified, the reddit will be the main reddit.
    def initialize(name = nil)
      @name = name
      @url = @name.nil? ? BASE_URL : SUBREDDIT_URL.gsub('[subreddit]', @name)
    end
    
    def hot(options = {})
      articles 'hot', options
    end
    
    def top(options = {})
      articles 'top', options
    end
    
    def new(options = {})
      options[:querystring] = 'sort=new'
      articles 'new', options
    end
    
    def rising(options = {})
      options[:querystring] = 'sort=rising'
      articles 'new', options
    end
    
    def controversial(options = {})
      articles 'controversial', options
    end
    
    # Returns the articles found in this reddit.
    # Options are:
    #   Count: Return at least this many articles.
    #   Querystring: Querystring to append to resource request
    
    def articles(page = 'hot', options = {})
      get_resources("#{@url}#{page}", options) do |resource_json|
        Article.new(resource_json['data'])
      end
    end
  end
end