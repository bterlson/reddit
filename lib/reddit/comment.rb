module Reddit
  # A reddit comment.
  class Comment
    attr_reader :body, :name, :ups, :downs, :url, :domain, :author, :id, :created_at, :replies
    
    # Initializes the data for the comment.  Takes a hash of the various attributes as taken from the API.
    def initialize(attributes)
      @score = attributes['score']
      @name = attributes['name']
      @ups = attributes['ups']
      @downs = attributes['downs']
      @author = User.new(attributes['author']) unless attributes['author'].nil?
      @id = attributes['id']
      @created_at = Time.at(attributes['created']) unless attributes['created'].nil?
      @body = attributes['body']
      @replies = []
      
      unless attributes['replies'].nil? or attributes['replies']['data'].nil? or attributes['replies']['data']['children']
        attributes['replies']['data']['children'].each do |reply|
          @replies << Comment.new(reply['data'])
        end
      end
    end
    
    # Returns the score for this comment.
    def score
      return @ups - @downs
    end

    # returns a number representing how controversial this comment is
    def controversy_score
      (@ups + @downs).to_f / [score.abs, 1].max
    end
  end
end