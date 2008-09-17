module Reddit
  
  # A list of resources, such as a list of comments from an article or a user's page.
  class ResourceList
    attr_reader :url
    
    private
    
    # Grabs the resources at the URL and returns the parsed json.
    def get_resources(url, options = {}, &block)
      querystring = options.delete(:querystring) || ''
      count = options.delete(:count) || 25
      url = URI.parse(url)
      items = []
      after = ''
      
      while items.size < count
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.get("#{url.path}.json?#{querystring}&after=#{after}&limit=#{count - items.size}")
        }
      
        raise SubredditNotFound if res.is_a?(Net::HTTPRedirection)
      
        resources = JSON.parse(res.body, :max_nesting => 0)
      
        # comments pages are contained in an array where the first element is the article
        # and the second is the actual comments.  This is hackish.
        resources = resources.last if resources.is_a?(Array)
        resources = resources['data']['children']
        break if resources.size == 0
        resources.each do |resource|
          items << yield(resource)
        end
        
        after = items.last.name
      end
      
      items
    end
  end
  
end