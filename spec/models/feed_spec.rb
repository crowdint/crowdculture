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
  
  it "is invalid without author or url" do
    feed = Feed.new
    feed.should_not be_valid
  end
end
