# == Schema Information
#
# Table name: feeds
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  author     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Feed do
  it {should respond_to(:author)}
  it {should respond_to(:url)}
  it {should respond_to(:entries)}
  
  it "is invalid without author or url" do
    feed = Feed.new
    feed.should_not be_valid
  end
  
  describe "when calling feeds methods" do
    feed1 = Feed.create(url:'url1', author:'author1')
    feed2 = Feed.create(url:'url2', author:'author2')
    let(:feeds) { Feed.get_feeds_urls }

    subject{feeds}

    describe "#get_feeds_urls" do
      it {should include('url1')}
      it {should include('url2')}
    end

    describe "#get_feed_id" do
      it "should return the correct id" do
        Feed.get_feed_id('author1').should == 1
      end
    end

    describe "#get_feed_author" do
      it "should return the correct author" do
        Feed.get_feed_author(1).should == "author1"
      end
    end

    describe "#get_feed_name_from_url" do
      it "should return the correct author" do
        Feed.get_feed_author_from_url('url1').should == "author1"
      end
    end
  end  
end
