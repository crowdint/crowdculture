require 'spec_helper'

describe Parser do
  describe "#parse_feeds" do
    context "when parsing a valid feed" do
      it "should return a non empty array" do
        feed = ["http://crowdint.tumblr.com/rss"]
        Parser.parse_feed(feed).should_not be_empty
      end
    end
    context "when parsing an invalid feed" do
      it "should return an empty array" do
        Parser.parse_feed('invalid_feed').should == []
      end
    end
  end

  describe "#get_box_size" do
    context "when type is != 'Tweet'" do
      it "should return 1" do
        box_size = Parser.get_box_size('not_tweet', 'title')
        box_size.should be 1
      end
      it "should not call #get_tweet_length" do
        Tweet.should_not_receive(:get_tweet_length)
        box_size = Parser.get_box_size('not_tweet', 'title')
      end
    end
    context "when type is = 'Tweet'" do
      it "should return 2" do
        tweet = "very"* 33 + "long tweet"
        Tweet.stub(:get_tweet_length).with(tweet[10..-1]).and_return(2)
        box_size = Parser.get_box_size('Tweet', tweet)
        box_size.should be 2
      end
      it "should call #get_tweet_length" do
        tweet = "very"* 33 + "long tweet"
        Tweet.should_receive(:get_tweet_length).with(tweet[10..-1])
        box_size = Parser.get_box_size('Tweet', tweet)
      end
    end
  end

  describe "#get_title" do
    context "when author = 'Tumblr'" do
    end
    context "when author = 'Twitter'" do
    end
    context "when author is not 'Tumblr' or 'Twitter'" do
    end
  end
end