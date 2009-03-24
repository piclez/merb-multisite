require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/pages" do
  before(:each) do
    Site.all.destroy!
    Page.all.destroy!
  end
  
  it "should display 2 pages for www.merbmultisite.com" do
    site = Factory.create(:site)
    page1 = Factory.create(:page, :site => site)
    page2 = Factory.create(:page, :site => site, :name => "About Us")
    response = request("/pages", {'HTTP_HOST' => 'www.merbmultisite.com'})
    response.should be_successful
    response.should have_xpath('//ul/li[2]') # We have at least 2 pages
    response.should have_selector("h1:contains('Welcome to site Merb Multisite.')")
  end
  
  it "should display 1 page for www.merb.com" do
    site2 = Factory.create(:site, :domain => "merb.com", :path => "merb")
    page3 = Factory.create(:page, :site => site2, :name => "Contact")
    response = request("http://www.merb.com/pages", {'HTTP_HOST' => 'www.merb.com'})
    response.should be_successful
    response.should have_xpath('//ul/li[1]') # We have at least 1 page
    response.should have_selector("h1:contains('Merb.com awesome!')")
  end
  
  it "should display page not found for www.merbmultisite.net" do
    response = request("/pages", {'HTTP_HOST' => 'www.merbmultisite.net'})
    response.should be_missing
    response.should have_xpath("//div[2]/p['Merb::ControllerExceptions::NotFound']")
  end
end