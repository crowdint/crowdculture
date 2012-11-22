# == Schema Information
#
# Table name: entries
#
#  id                  :integer         not null, primary key
#  feed_id             :integer
#  content_url         :string(255)
#  published_date      :date
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
  
  it "is should have title, entry_id, feed_id, published_date & type" do
    entry = Entry.new
    entry.should_not be_valid
  end

  it "is should have an unique entry_id" do
    entry = Entry.create(title:'title', content_url:'http://example', entry_id:'unique', feed_id:'1', published_date:'2012-10-31')
    entry2 = Entry.new(title:'title', content_url:'http://example', entry_id:'unique', feed_id:'1', published_date:'2012-10-31')
    entry2.should_not be_valid
  end
end
