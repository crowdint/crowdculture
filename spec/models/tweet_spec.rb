# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :datetime
#  title               :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  entry_id            :string(255)
#  type                :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  box_size            :integer         default(1)
#

require 'spec_helper'

describe Tweet do
  it {should respond_to(:title)}
  it {should respond_to(:content_url)}
  it {should respond_to(:entry_id)}
  it {should respond_to(:feed_id)}
  it {should respond_to(:published_date)}
  it {should respond_to(:type)}
  it {should respond_to(:box_size)}
  it {should respond_to(:avatar)}
  it {should be_kind_of(Entry)}
  it {should respond_to(:feed)}
  its(:type) {should == 'Tweet'}

  describe "#get_tweet_length" do
    context "tweet length <= 120 char" do
      it "should return box_size = 1" do
        tweet_text = "short tweet"
        Tweet.get_tweet_length(tweet_text).should == 1
      end
    end
    context "tweet length > 120 char" do
      it "should return box_size = 2" do
        tweet_text = "very"* 30 + "long tweet"
        Tweet.get_tweet_length(tweet_text).should == 2
      end
    end
  end

  describe "#paint_tweet_text" do
    context "when text has at least one @" do
      it "should add a span tag around it" do
        tweet = "What a cool tweet! @crowdint"
        Tweet.paint_tweet_text(tweet).should == "what a cool tweet! <span>@crowdint</span>"
      end
    end
    context "when text has at least one #" do
      it "should add a span tag around it" do
        tweet = "What a cool tweet! #not"
        Tweet.paint_tweet_text(tweet).should == "what a cool tweet! <span>#not</span>"
      end
    end
    context "when text has a link" do
      it "should add a span tag around it" do
        tweet = "What a cool tweet! http://link.com"
        Tweet.paint_tweet_text(tweet).should == "what a cool tweet! <span>http://link.com</span>"
      end
    end
    context "when text has @, # and links" do
      it "should add a span tag around each" do
        tweet = "Beautiful tests #not @crowdint http://link.com"
        Tweet.paint_tweet_text(tweet).should == "beautiful tests <span>#not</span> <span>@crowdint</span> <span>http://link.com</span>"
      end
    end
  end

  describe "#most_recent_tweets" do
    let(:oldest){ Tweet.create(entry_id:'1', title:'title1', feed_id:'1', published_date:'2000-10-31')}
    Tweet.create(entry_id:'2', title:'title1', feed_id:'1', published_date:'2008-10-31')
    Tweet.create(entry_id:'3', title:'title1', feed_id:'1', published_date:'2009-10-31')
    Tweet.create(entry_id:'4', title:'title1', feed_id:'1', published_date:'2010-10-31')
    Tweet.create(entry_id:'5', title:'title1', feed_id:'1', published_date:'2011-10-31')
    let(:most_recent){ Tweet.create(entry_id:'6', title:'title1', feed_id:'1', published_date:'2012-10-31')}
    
    subject {Tweet.most_recent_tweets(1)}

    its (:size) {should be 4}
    it {should_not include(oldest)}
    it {should include(most_recent)}
  end
end