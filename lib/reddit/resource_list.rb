module Reddit
  
  # A list of resources, such as a list of comments from an article or a user's page.
  class ResourceList
    attr_reader :url
    
    private
    
    # Grabs the resources at the URL and returns the parsed json.
    def get_resources(url)
      puts "Getting URL: #{url}"
      url = URI.parse(url)
      
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.get(url.path + ".json")
      }
      
      raise SubredditNotFound if res.is_a?(Net::HTTPRedirection)
      resources = JSON.parse(res.body, :max_nesting => 0)
      
      # comments pages are contained in an array where the first element is the article
      # and the second is the actual comments.  This is hackish.
      resources = resources.last if resources.is_a?(Array)
      
      return resources['data']['children']
    end
  end
end