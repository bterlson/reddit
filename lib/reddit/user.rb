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
    # Options can include a limit, which sets the number of comments to return.
    
    def comments(options = {})
      get_resources("#{@url}comments/", :querystring => options[:querystring], :count => options[:count]) do |resource_json|
        Comment.new(resource_json['data'])
      end
    end
  end
end