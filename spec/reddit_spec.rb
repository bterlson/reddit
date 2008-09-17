require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::Reddit do
  before do
    @reddit = Reddit::Reddit.new("programming")
  end
  
  def test_articles
    [
        {:type => 't1', :data => {:attribute => 'value'}},
        {:type => 't1', :data => {:attribute => 'value2'}}
    ]
  end
  
  it "should know its url" do
    @reddit.url.should == Reddit::SUBREDDIT_URL.gsub('[subreddit]', 'programming')
  end
  
  it "should find the articles" do
    mock_article = mock(Reddit::Article)
    @reddit.should_receive(:get_resources).and_return([mock_article, mock_article])
    @reddit.articles.should == [mock_article, mock_article]
  end
  
  it "should find top articles" do
    mock_article = mock(Reddit::Article)
    
    @reddit.should_receive(:articles).with('top', {}).and_return([mock_article, mock_article])
    
    @reddit.top.should == [mock_article, mock_article]
  end
  
  it "should find new articles" do
    mock_article = mock(Reddit::Article)
    
    @reddit.should_receive(:articles).with('new', {:querystring => 'sort=new'}).and_return([mock_article, mock_article])
    
    @reddit.new.should == [mock_article, mock_article]
  end
  
  it "should find rising articles" do
    mock_article = mock(Reddit::Article)
    
    @reddit.should_receive(:articles).with('new',  {:querystring => 'sort=rising'}).and_return([mock_article, mock_article])
    
    @reddit.rising.should == [mock_article, mock_article]
  end
  
  it "should find controversial articles" do
    mock_article = mock(Reddit::Article)
    
    @reddit.should_receive(:articles).with('controversial', {}).and_return([mock_article, mock_article])
    
    @reddit.controversial.should == [mock_article, mock_article]
  end
  
  it "should find hot articles" do
    mock_article = mock(Reddit::Article)
    
    @reddit.should_receive(:articles).with('hot', {}).and_return([mock_article, mock_article])
    
    @reddit.hot.should == [mock_article, mock_article]
  end
  
end

describe Reddit::Reddit, "With no subreddit specified" do
  it "should use the main reddit" do
    reddit = Reddit::Reddit.new()
    reddit.url.should == Reddit::BASE_URL
  end  
end