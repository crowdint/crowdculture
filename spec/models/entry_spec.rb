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

describe Entry do
  it {should respond_to(:title)}
  it {should respond_to(:content_url)}
  it {should respond_to(:entry_id)}
  it {should respond_to(:feed_id)}
  it {should respond_to(:published_date)}
  it {should respond_to(:type)}
  it {should respond_to(:box_size)}
  it {should respond_to(:avatar)}
  it {should respond_to(:feed)}
  
  describe "when creating a new Entry" do
    context "with invalid information" do
      it "should have title, entry_id, feed_id, published_date & type" do
        entry = Entry.new
        entry.should_not be_valid
      end

      it "should have an unique entry_id" do
        entry = Entry.create(title:'title', content_url:'http://example', entry_id:'unique', feed_id:'1', published_date:'2012-10-31', type:'Quote')
        entry2 = Entry.new(title:'title', content_url:'http://example', entry_id:'unique', feed_id:'1', published_date:'2012-10-31', type:'Quote')
        entry.should be_valid
        entry2.should_not be_valid
      end
    end

    context "with valid information" do
      it "should get sorted by published_date DESC" do
        old = Quote.create(published_date:'2011-10-2', title:'title', content_url:'http://example', entry_id:'unique1', feed_id:'1')
        most_recent = Quote.create(published_date:'2012-10-3', title:'title', content_url:'http://example', entry_id:'unique3', feed_id:'1')
        recent = Quote.create(published_date:'2012-09-1', title:'title', content_url:'http://example', entry_id:'unique2', feed_id:'1')
        Entry.first.should == most_recent
      end
    end
  end

  describe "#entry_exists?" do
    context "when entry_id doesn exist" do
      it "should return fale" do
        Entry.entry_exists?('falseId').should be_false
      end
    end
    context "when entry_id doesn exist" do
      it "should return false" do
        Entry.create(entry_id:'realId', title:'title', content_url:'http://example', feed_id:'1', published_date:'2000-10-31', type:'Quote')
        Entry.entry_exists?('realId').should be_true
      end 
    end
  end

  describe "#check_for_news" do
    context "when there are no new records" do
      it "should not return any news" do
        Entry.create(entry_id:'oldEntry', title:'title', content_url:'http://example', feed_id:'1', published_date:'2000-10-31', type:'Quote')
        entry = stub(entry_id: 'oldEntry')
        entries = []
        entries << entry
        news = Entry.check_for_news(entries)
        news.should be_empty
      end
    end

    context "when there are new records" do
      it "should return news" do
        entry = stub(entry_id: 'oldEntry')
        entries = []
        entries << entry
        news = Entry.check_for_news(entries)
        news.should_not be_empty
        news.should include(entry)
      end
    end
  end

end
