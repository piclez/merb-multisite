require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Site do

  it "should have a valid site" do
    Factory.build(:site).should be_valid
  end

end