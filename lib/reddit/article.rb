module Reddit
  # A reddit article or submission.
  class Article
    attr_reader :score, :name, :title, :comment_count, :ups, :downs, :url, :domain, :author, :id, :created_at
    
    # Initializes the data for the article.  Takes a hash of the various attributes as taken from the API.
    def initialize(attributes)
      @score = attributes['score']
      @name = attributes['name']
      @title = attributes['title']
      @comment_count = attributes['num_comments']
      @ups = attributes['ups']
      @downs = attributes['downs']
      @url = attributes['url']
      @domain = attributes['domain']
      @author = User.new(attributes['author']) unless attributes['author'].nil?
      @id = attributes['id']
      # Reddit's created_at timestamps are currently wonky, so this will return the wrong time.
      @created_at = Time.at(attributes['created']) unless attributes['created'].nil?
      @saved = attributes['saved']
      @clicked = attributes['clicked']
      @hidden = attributes['hidden']
    end
    
    # indicates if the current logged in user has saved the article.
    def saved?
      return @saved
    end
    
    # indicates if the current logged in user has clicked the article.
    def clicked?
      return @clicked
    end
    
    # indicates if the current logged in user has hidden the article.
    def hidden?
      return @hidden
    end
    
    # returns a CommentList of this article's comments.
    def comments(options = {})
      @comments_list ||= CommentList.new(@id)
      return @comments_list.top_level(options)
    end
  end
end