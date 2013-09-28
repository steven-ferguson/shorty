require 'spec_helper'

describe Url do
	describe '#long' do
	  it { should validate_presence_of :long }

	  it "should not validate an improper url" do
	  	url = Url.new(long: 'yahoo.com')
	  	expect(url).to_not be_valid
	  end

	  it "should validate a proper url" do
	  	url = Url.new(long: 'http://www.google.com')
	  	expect(url).to be_valid
	  end

	  it "should validate a variety of proper urls" do
	  	url = Url.new(long: 'http://google.com')
	  	expect(url).to be_valid
	  end
	end

	context "after create" do
		it "sets #short to 'shorty' + #id" do
			url = Url.create(long: 'http://www.google.com')
			expect(url.short).to eq "shorty#{url.id}"
		end
	end
end
