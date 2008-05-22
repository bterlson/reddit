module Reddit
  BASE_URL = "http://www.beta.reddit.com/"
  PROFILE_URL = BASE_URL + "user/[username]/"
  SUBREDDIT_URL = BASE_URL + "r/[subreddit]/"
  COMMENTS_URL = BASE_URL + "info/[id]/comments/"
  
  # raised when attempting to interact with a subreddit that doesn't exist.
  class SubredditNotFound < StandardError; end
  
  # raised when attempting to interact with a profile that doesn't exist.
  class ProfileNotFound < StandardError; end
  
  # raised when attempting to log in with incorrect credentials.
  class AuthenticationException < StandardError; end
  
  # A reddit browsing session.
  class Session

    # initialize the session with a username and password.  Currently not used.
    def initialize(username = "", password = "")
      @username = username
      @password = password
    end
    
    # return the main reddit.
    def main
      return Reddit.new()
    end
    
    # return a specific subreddit.
    def subreddit(subreddit)
      return Reddit.new(subreddit)
    end
    
    # return a specific user's page.
    def user(username)
      return User.new(username)
    end
    
  end
end
