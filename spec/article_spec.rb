require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::Article do
  before do
    @article = Reddit::Article.new({"id" => "id"})
  end
  
  it "should be able to get the article's comments comments" do
    Reddit::CommentList.should_receive(:new).with("id").and_return("reddit!")
    @article.comments.should == "reddit!"
  end
end