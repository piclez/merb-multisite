require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Page do

  it "should have a valid page" do
    Factory.build(:page).should be_valid
  end

end