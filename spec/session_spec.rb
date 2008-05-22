require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::Session, "without logging in" do
  
  before(:each) do
    @reddit = Reddit::Session.new()
  end

  it "should grab the main page" do
    @reddit.main.should_not be_nil
  end
  
  it "should grab a user's profile page" do
    @reddit.user("radhruin").should_not be_nil
  end
  
  it "should grab a subreddit" do
    @reddit.subreddit("programming").should_not be_nil
  end
end

