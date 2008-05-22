require File.dirname(__FILE__) + '/spec_helper.rb'

describe Reddit::ResourceList, ".get_resources" do
  before do
    @resource_list = Reddit::ResourceList.new
    @http_mock = mock('http')
    @http_mock.stub!(:get)
    @response_mock = mock(Net::HTTPResponse)
    @response_mock.stub!(:body).and_return('{"kind": "Listing", "data": {"children": [{"kind": "t3", "data": {"attribute": "value"}}]}}')
    Net::HTTP.stub!(:start).and_yield(@http_mock).and_return(@response_mock)
  end
  
  it "should get the resources from Reddit" do
    Net::HTTP.should_receive(:start).and_yield(@http_mock).and_return(@response_mock)
    @resource_list.send(:get_resources, "http://reddit.com")
  end
  
  it "should parse the JSON" do
    JSON.should_receive(:parse).and_return({'kind' => 'Listing', 'data' => {'children' => [{'data' => {'attribute' => 'value'}}]}})
    @resource_list.send(:get_resources, "http://reddit.com")
  end
  
  it "should raise an error when the subreddit is not found" do
    reddit = Reddit::Reddit.new("not found")
    @response_mock.stub!(:is_a?).and_return(Net::HTTPRedirection)
    
    proc {@resource_list.send(:get_resources, "http://reddit.com")}.should raise_error(Reddit::SubredditNotFound)
  end
end