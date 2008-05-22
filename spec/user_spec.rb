require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::User do
  before do
    @user = Reddit::User.new('radhruin')
  end
  
  it "should know its url" do
    @user.url.should == Reddit::PROFILE_URL.gsub('[username]', 'radhruin')
  end
  
  it "should fetch the user's comments" do
    @user.should_receive(:get_resources).and_return([
        {:type => 't1', :data => {:attribute => 'value'}},
        {:type => 't1', :data => {:attribute => 'value2'}}
    ])
    
    mock_comment = mock(Reddit::Comment)
    Reddit::Comment.should_receive(:new).twice.and_return(mock_comment)
    
    @user.comments.should == [mock_comment, mock_comment]
  end
end