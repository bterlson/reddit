require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::Comment do
  before do
    @comment = Reddit::Comment.new({
      'ups' => 5,
      'downs' => 6,
      'replies' => {'data' => {'children' => [
          {'data' => {'ups' => 1, 'downs' => 6}}
        ]}}
    })
  end
  
  it "should have replies" do
    @comment.replies.should_not be_nil
  end
  
  it "should calculate its score" do
    @comment.score.should == -1
  end
end