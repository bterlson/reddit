require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::Reddit do
  before do
    @reddit = Reddit::Reddit.new("programming")
  end
  
  it "should know its url" do
    @reddit.url.should == Reddit::SUBREDDIT_URL.gsub('[subreddit]', 'programming')
  end
  
  it "should find the articles" do
    @reddit.should_receive(:get_resources).and_return([
        {:type => 't1', :data => {:attribute => 'value'}},
        {:type => 't1', :data => {:attribute => 'value2'}}
    ])
    
    mock_article = mock(Reddit::Article)
    Reddit::Article.should_receive(:new).twice.and_return(mock_article)
    
    @reddit.articles.should == [mock_article, mock_article]
  end
end

describe Reddit::Reddit, "With no subreddit specified" do
  it "should use the main reddit" do
    reddit = Reddit::Reddit.new()
    reddit.url.should == Reddit::BASE_URL
  end  
end