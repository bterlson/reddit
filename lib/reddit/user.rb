module Reddit
  
  # A user's page.
  class User < ResourceList
    attr_reader :name
    
    # Initialize based on the user's name.
    def initialize(name)
      @name = name
      @url = PROFILE_URL.gsub('[username]', @name)
    end
    
    # Get the user's comments.
    def comments
      resources = get_resources(@url)
      
      comments = []
      resources.each do |comment|
        comments << Comment.new(comment['data'])
      end
      
      return comments
    end
  end
end