require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/sites" do
  before(:each) do
    Site.all.destroy!
    merbmultisite = Factory.create(:site)
    merb = Factory.create(:site, :domain => "merb.com", :path => "merb")
  end
  
  it "should access www.merbmultisite.com site" do
    response = request("/", {'HTTP_HOST' => 'www.merbmultisite.com'})
    response.should be_successful
  end
  
  it "should access merbmultisite.com site" do
    response = request("/", {'HTTP_HOST' => 'merbmultisite.com'})
    response.should be_successful
  end
  
  it "should access merb.com site" do
    response = request("/", {'HTTP_HOST' => 'www.merb.com'})
    response.should be_successful
    response.should have_selector("h1:contains('Merb.com awesome!')")
  end
  
  it "should not access merbmultisite.net site" do
    response = request("/", {'HTTP_HOST' => 'www.merbmultisite.net'})
    response.should be_missing
  end
end