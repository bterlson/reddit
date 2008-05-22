require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::CommentList do
  before do
    @comments_list = Reddit::CommentList.new('id')
  end
  
  it "should know its url" do
    @comments_list.url.should == Reddit::COMMENTS_URL.gsub('[id]', 'id')
  end
  
  it "should fetch the top level comments" do
    @comments_list.should_receive(:get_resources).and_return([
        {:type => 't1', :data => {:attribute => 'value'}},
        {:type => 't1', :data => {:attribute => 'value2'}}
    ])
    
    mock_comment = mock(Reddit::Comment)
    Reddit::Comment.should_receive(:new).twice.and_return(mock_comment)
    
    @comments_list.top_level.should == [mock_comment, mock_comment]
  end
  
  it "should redirect method calls to the top level comments" do
    top_level_mock = mock('top_level')
    top_level_mock.should_receive(:[]).and_return("array")
    @comments_list.stub!(:top_level).and_return(top_level_mock)
    
    @comments_list[1].should == "array"
  end
end