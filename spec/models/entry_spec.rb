# == Schema Information
#
# Table name: entries
#
#  id             :integer         not null, primary key
#  feed_id        :integer
#  img_url        :string(255)
#  published_date :date
#  title          :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  entry_id       :string(255)
#

require 'spec_helper'

describe Entry do
  it {should respond_to(:title)}
  it {should respond_to(:img_url)}
  it {should respond_to(:entry_id)}
  it {should respond_to(:feed_id)}
  it {should respond_to(:published_date)}
  
  it "is should have title, img_url, entry_id, feed_id and published_date" do
    entry = Entry.new
    entry.should_not be_valid
  end

  it "is should have an unique entry_id" do
    entry = Entry.create(title:'title', img_url:'http://example', entry_id:'unique', feed_id:'1', published_date:'2012-10-31')
    entry2 = Entry.new(title:'title', img_url:'http://example', entry_id:'unique', feed_id:'1', published_date:'2012-10-31')
    entry2.should_not be_valid
  end
end
